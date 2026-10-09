; Select the move-name list from wOptions and load the move in wNamedObjectIndex.
GetMoveName_::
	ld a, [wOptions]
	bit BIT_MOVE_NAMES_LOWERCASE, a
	ld a, MOVE_NAME
	jr z, .uppercase
	ld a, MOVE_NAME_LOWERCASE
.uppercase
	ld [wNameListType], a
	ld a, [wNamedObjectIndex]
	ld [wNameListIndex], a
	; Both tables share one bank and use the same move-ID ordering.
	ld a, BANK(MoveNamesLowercase)
	ld [wPredefBank], a
	call GetName
	ld de, wNameBuffer
	ret

; Rebuild wOptions from the current cursor positions, including the move-name case bit.
SetOptionsFromCursorPositions::
	ld hl, TextSpeedOptionData
	ld a, [wOptionsTextSpeedCursorX] ; text speed cursor X coordinate
	ld c, a
.loop
	ld a, [hli]
	cp c
	jr z, .textSpeedMatchFound
	inc hl
	jr .loop
.textSpeedMatchFound
	ld a, [hl]
	ld d, a
	ld a, [wOptionsBattleAnimCursorX] ; battle animation cursor X coordinate
	dec a
	jr z, .battleAnimationOn
.battleAnimationOff
	set BIT_BATTLE_ANIMATION, d
	jr .checkBattleStyle
.battleAnimationOn
	res BIT_BATTLE_ANIMATION, d
.checkBattleStyle
	ld a, [wOptionsBattleStyleCursorX] ; battle style cursor X coordinate
	dec a
	jr z, .battleStyleShift
.battleStyleSet
	set BIT_BATTLE_SHIFT, d
	jr .checkMoveNameCase
.battleStyleShift
	res BIT_BATTLE_SHIFT, d
.checkMoveNameCase
	ld a, [wOptionsMoveNameCaseCursorX]
	cp 1
	jr z, .moveNamesUppercase
	set BIT_MOVE_NAMES_LOWERCASE, d
	jr .storeOptions
.moveNamesUppercase
	res BIT_MOVE_NAMES_LOWERCASE, d
.storeOptions
	ld a, d
	ld [wOptions], a
	ret

; Initialize all option cursors from wOptions and draw their arrows in the menu.
SetCursorPositionsFromOptions::
	ld hl, TextSpeedOptionData + 1
	ld a, [wOptions]
	ld c, a
	and TEXT_DELAY_MASK
	push bc
	ld de, 2
	call IsInArray
	pop bc
	dec hl
	ld a, [hl]
	ld [wOptionsTextSpeedCursorX], a ; text speed cursor X coordinate
	hlcoord 0, 3
	call .placeUnfilledRightArrow
	sla c
	ld a, 1 ; On
	jr nc, .storeBattleAnimationCursorX
	ld a, 10 ; Off
.storeBattleAnimationCursorX
	ld [wOptionsBattleAnimCursorX], a ; battle animation cursor X coordinate
	hlcoord 0, 7
	call .placeUnfilledRightArrow
	sla c
	ld a, 1
	jr nc, .storeBattleStyleCursorX
	ld a, 10
.storeBattleStyleCursorX
	ld [wOptionsBattleStyleCursorX], a ; battle style cursor X coordinate
	hlcoord 0, 11
	call .placeUnfilledRightArrow
	; The move-name case follows the text-speed and battle-option bits in wOptions.
	sla c
	ld a, 1 ; uppercase
	jr nc, .storeMoveNameCaseCursorX
	ld a, 10 ; lowercase
.storeMoveNameCaseCursorX
	ld [wOptionsMoveNameCaseCursorX], a
	hlcoord 0, 15
	call .placeUnfilledRightArrow
; cursor in front of Cancel
	hlcoord 0, 17
	ld a, 1
.placeUnfilledRightArrow
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], "▷"
	ret

; table that indicates how the 3 text speed options affect frame delays
; Format:
; 00: X coordinate of menu cursor
; 01: delay after printing a letter (in frames)
TextSpeedOptionData:
	db 14, TEXT_DELAY_SLOW
	db  7, TEXT_DELAY_MEDIUM
	db  1, TEXT_DELAY_FAST
	db  7, -1 ; end (default X coordinate)
