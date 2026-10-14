; Select the move-name list from wOptions and load the move in wNamedObjectIndex.
GetMoveName_::
	ASSERT BANK(MoveNames) == BANK(MoveNamesLowercase)
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

; Rebuild from text speed, whose value leaves all setting flags clear.
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
	ASSERT (TEXT_DELAY_FAST | TEXT_DELAY_MEDIUM | TEXT_DELAY_SLOW) & ~TEXT_DELAY_MASK == 0
	ld a, [wOptionsBattleAnimCursorX] ; battle animation cursor X coordinate
	dec a
	jr z, .checkBattleStyle
	set BIT_BATTLE_ANIMATION, d
.checkBattleStyle
	ld a, [wOptionsBattleStyleCursorX] ; battle style cursor X coordinate
	dec a
	jr z, .checkMoveNameCase
	set BIT_BATTLE_SHIFT, d
.checkMoveNameCase
	ld a, [wOptionsMoveNameCaseCursorX]
	cp 1
	jr z, .checkNicknames
	set BIT_MOVE_NAMES_LOWERCASE, d
.checkNicknames
	ld a, [wOptionsNicknamesCursorX]
	cp 1
	jr z, .storeOptions
	set BIT_HIDE_NICKNAMES, d
.storeOptions
	ld a, d
	ld [wOptions], a
	ret

; Retain the original choice encodings; they no longer control cursor placement.
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
	sla c
	ld a, 1 ; On
	jr nc, .storeBattleAnimationCursorX
	ld a, 10 ; Off
.storeBattleAnimationCursorX
	ld [wOptionsBattleAnimCursorX], a ; battle animation cursor X coordinate
	sla c
	ld a, 1
	jr nc, .storeBattleStyleCursorX
	ld a, 10
.storeBattleStyleCursorX
	ld [wOptionsBattleStyleCursorX], a ; battle style cursor X coordinate
	; The move-name case follows the text-speed and battle-option bits in wOptions.
	sla c
	ld a, 1 ; uppercase
	jr nc, .storeMoveNameCaseCursorX
	ld a, 10 ; lowercase
.storeMoveNameCaseCursorX
	ld [wOptionsMoveNameCaseCursorX], a
	sla c
	ld a, 1 ; SHOW is the default when BIT_HIDE_NICKNAMES is clear
	jr nc, .storeNicknames
	ld a, 10
.storeNicknames
	ld [wOptionsNicknamesCursorX], a
	ret

; Center the eight-tile value field on screen; only the active row gets paired arrows.
DrawSelectedOptionValues::
	ld a, [wOptionsTextSpeedCursorX]
	ld de, .fast
	cp 1
	jr z, .textSpeed
	ld de, .medium
	cp 7
	jr z, .textSpeed
	ld de, .slow
.textSpeed
	hlcoord 6, 2
	ld b, 2
	call .drawValue
	ld a, [wOptionsBattleAnimCursorX]
	ld de, .on
	cp 1
	jr z, .battleAnimation
	ld de, .off
.battleAnimation
	hlcoord 6, 5
	ld b, 5
	call .drawValue
	ld a, [wOptionsBattleStyleCursorX]
	ld de, .shift
	cp 1
	jr z, .battleStyle
	ld de, .set
.battleStyle
	hlcoord 6, 8
	ld b, 8
	call .drawValue
	ld a, [wOptionsMoveNameCaseCursorX]
	ld de, .upper
	cp 1
	jr z, .moveNameCase
	ld de, .lower
.moveNameCase
	hlcoord 6, 11
	ld b, 11
	call .drawValue
	ld a, [wOptionsNicknamesCursorX]
	ld de, .show
	cp 1
	jr z, .nicknames
	ld de, .hide
.nicknames
	hlcoord 6, 14
	ld b, 14
	call .drawValue
	; DONE is not a value selector, so retain its conventional single cursor.
	ld a, [wTopMenuItemY]
	cp 17
	ld a, " "
	jr nz, .cancel
	ld a, "▶"
.cancel
	ldcoord_a 1, 17
	ret
.drawValue
	push bc
	push hl
	call PlaceString
	pop hl
	pop bc
	dec hl
	ld a, [wTopMenuItemY]
	cp b
	ld a, " "
	jr nz, .leftArrow
	ld a, "◀"
.leftArrow
	ld [hl], a
	ld de, 9
	add hl, de
	; A still holds the left arrow or a blank; mirror it without another row lookup.
	cp "◀"
	jr nz, .rightArrow
	ld a, "▶"
.rightArrow
	ld [hl], a
	ret
.fast
	db "  FAST  @"
.medium
	db " MEDIUM @"
.slow
	db "  SLOW  @"
.on
	db "  ON    @"
.off
	db "  OFF   @"
.show
	db "  SHOW  @"
.hide
	db "  HIDE  @"
.shift
	db " SHIFT  @"
.set
	db "  SET   @"
.upper
	db " UPPER  @"
.lower
	db " Lower  @"

; table that indicates how the 3 text speed options affect frame delays
; Format:
; 00: X coordinate of menu cursor
; 01: delay after printing a letter (in frames)
TextSpeedOptionData:
	db 14, TEXT_DELAY_SLOW
	db  7, TEXT_DELAY_MEDIUM
	db  1, TEXT_DELAY_FAST
	db  7, -1 ; end (default X coordinate)
