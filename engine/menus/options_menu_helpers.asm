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
	; These four contiguous choices map to bits 7..4; choice 10 sets the bit.
	ASSERT wOptionsBattleStyleCursorX == wOptionsBattleAnimCursorX + 1
	ASSERT wOptionsMoveNameCaseCursorX == wOptionsBattleAnimCursorX + 2
	ASSERT wOptionsNicknamesCursorX - wOptionsBattleAnimCursorX == 3
	ASSERT BIT_BATTLE_ANIMATION == 7 && BIT_BATTLE_SHIFT == 6
	ASSERT BIT_MOVE_NAMES_LOWERCASE == 5 && BIT_HIDE_NICKNAMES == 4
	ld hl, wOptionsBattleAnimCursorX
	ld b, 4
	ld e, 1 << BIT_BATTLE_ANIMATION
.optionFlags
	ld a, [hli]
	dec a
	jr z, .nextOption
	ld a, d
	or e
	ld d, a
.nextOption
	srl e
	dec b
	jr nz, .optionFlags
	ld a, d
	ld [wOptions], a
	; Extended choices use the opposite polarity: choice 1 sets bits 0..3.
	ASSERT wOptionsMonNameCaseCursorX == wOptionsItemNameCaseCursorX + 1
	ASSERT wOptionsTrainerNameCaseCursorX == wOptionsItemNameCaseCursorX + 2
	ASSERT wOptionsAutoSaveCursorX - wOptionsItemNameCaseCursorX == 3
	ASSERT BIT_ITEM_NAMES_UPPERCASE == 0 && BIT_MON_NAMES_UPPERCASE == 1
	ASSERT BIT_TRAINER_NAMES_UPPERCASE == 2 && BIT_AUTO_SAVE == 3
	ld hl, wOptionsItemNameCaseCursorX
	ld b, 4
	ld d, 0
.extendedFlags
	ld a, [hli]
	cp 2 ; carry for choice 1, clear for choice 10
	rr d
	dec b
	jr nz, .extendedFlags
	swap d ; the four shifts assembled the flags in the high nibble
	ld a, d
	ld [wNameCaseOptions], a
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
	ld hl, wOptionsBattleAnimCursorX
	ld b, 4
.optionFlags
	sla c
	ld a, 1
	jr nc, .storeOption
	ld a, 10
.storeOption
	ld [hli], a
	dec b
	jr nz, .optionFlags
	ld a, [wNameCaseOptions]
	ld c, a
	ld hl, wOptionsItemNameCaseCursorX
	ld b, 4
.nameCaseLoop
	srl c
	ld a, 10 ; clear = Lower for names, Off for Auto Save
	jr nc, .storeNameCase
	ld a, 1
.storeNameCase
	ld [hli], a
	dec b
	jr nz, .nameCaseLoop
	ret

; Redraw the entire page so no labels, values, or arrows survive a page switch.
DrawOptionsPage::
	call ClearScreen
	hlcoord 0, 0
	lb bc, 15, 18
	call TextBoxBorder
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 7
	ld [wTopMenuItemX], a
	hlcoord 8, 17
	ld de, OptionMenuCancelText
	call PlaceString
	ld a, [wOptionsPage]
	and a
	jr nz, .secondPage
	hlcoord 1, 1
	ld de, TextSpeedOptionText
	call PlaceString
	hlcoord 1, 4
	ld de, AutoSaveOptionText
	call PlaceString
	hlcoord 1, 7
	ld de, BattleAnimationOptionText
	call PlaceString
	hlcoord 1, 10
	ld de, BattleStyleOptionText
	call PlaceString
	hlcoord 1, 13
	ld de, ShowNicknamesOptionText
	call PlaceString
	ld de, .next
	hlcoord 15, 17
	jp PlaceString
.secondPage
	hlcoord 1, 1
	ld de, MoveNameCaseOptionText
	call PlaceString
	hlcoord 1, 4
	ld de, ItemNameCaseOptionText
	call PlaceString
	hlcoord 1, 7
	ld de, MonNameCaseOptionText
	call PlaceString
	hlcoord 1, 10
	ld de, TrainerNameCaseOptionText
	call PlaceString
	ld de, .prev
	hlcoord 2, 17
	jp PlaceString
.next
	db "Next@"
.prev
	db "Prev@"

; Each page has two footer entries: centered Done and its page-change control.
ToggleOptionsFooter::
	ld a, [wOptionsPage]
	and a
	ld b, 7 ^ 14
	jr z, .toggle
	ld b, 7 ^ 1
.toggle
	ld a, [wTopMenuItemX]
	xor b
	ld [wTopMenuItemX], a
	ret

; Labels must share the drawing routine's ROM bank for PlaceString.
TextSpeedOptionText:
	db "TEXT SPEED@"
AutoSaveOptionText:
	db "AUTO SAVE@"
BattleAnimationOptionText:
	db "BATTLE ANIMATION@"
BattleStyleOptionText:
	db "BATTLE STYLE@"
MoveNameCaseOptionText:
	db "MOVE NAME CASE@"
ItemNameCaseOptionText:
	db "ITEM NAME CASE@"
MonNameCaseOptionText:
	db "#MON NAME CASE@"
TrainerNameCaseOptionText:
	db "TRAINER NAME CASE@"
ShowNicknamesOptionText:
	db "#MON NICKNAMES@"
OptionMenuCancelText:
	db "Done@"

; Center the eight-tile value field on screen; only the active row gets paired arrows.
DrawSelectedOptionValues::
	ld a, [wOptionsPage]
	and a
	jr nz, .moveNameCasePage
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
	ld a, [wOptionsAutoSaveCursorX]
	ld de, .on
	cp 1
	jr z, .autoSave
	ld de, .off
.autoSave
	hlcoord 6, 5
	ld b, 5
	call .drawValue
	ld a, [wOptionsBattleAnimCursorX]
	ld de, .on
	cp 1
	jr z, .battleAnimation
	ld de, .off
.battleAnimation
	hlcoord 6, 8
	ld b, 8
	call .drawValue
	ld a, [wOptionsBattleStyleCursorX]
	ld de, .shift
	cp 1
	jr z, .battleStyle
	ld de, .set
.battleStyle
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
	jr .footer
.moveNameCasePage
	ld a, [wOptionsMoveNameCaseCursorX]
	hlcoord 6, 2
	ld b, 2
	call .drawCase
	ld a, [wOptionsItemNameCaseCursorX]
	hlcoord 6, 5
	ld b, 5
	call .drawCase
	ld a, [wOptionsMonNameCaseCursorX]
	hlcoord 6, 8
	ld b, 8
	call .drawCase
	ld a, [wOptionsTrainerNameCaseCursorX]
	hlcoord 6, 11
	ld b, 11
	call .drawCase
.footer
	; Footer entries use single cursors, unlike the paired setting arrows.
	ld a, " "
	ldcoord_a 1, 17
	ldcoord_a 7, 17
	ldcoord_a 14, 17
	ld a, [wTopMenuItemY]
	cp 17
	ret nz
	hlcoord 0, 17
	ld a, [wTopMenuItemX]
	ld e, a
	ld d, 0
	add hl, de
.footerCursor
	ld a, "▶"
	ld [hl], a
	ret
.drawCase
	ld de, .upper
	cp 1
	jr z, .drawValue
	ld de, .lower
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
	db "  Fast  @"
.medium
	db " Medium @"
.slow
	db "  Slow  @"
.on
	db "   On   @"
.off
	db "  Off   @"
.show
	db "  Show  @"
.hide
	db "  Hide  @"
.shift
	db " Shift  @"
.set
	db "  Set   @"
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
