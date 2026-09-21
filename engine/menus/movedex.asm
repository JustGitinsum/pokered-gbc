ShowMoveDataFromBattle:
	call ClearScreen
	callfar LoadPokedexTilePatterns ; load pokedex tiles
	call HalfVolume
	call ClearScreen
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a
	ld a, [wMovedexMoveID] ; attack ID
	ld [wCurPartySpecies], a
	push af
	ld b, SET_PAL_GENERIC
	call RunPaletteCommand
	pop af
	ld [wMovedexMoveID], a
	call ShowNextMoveData
.waitForButtonPress
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and PAD_B
	jr z, .waitForButtonPress
	pop af
	ldh [hTileAnimations], a
	; call GBPalWhiteOut
	call ClearScreen
	call RunDefaultPaletteCommand
	; call LoadTextBoxTilePatterns
	call GBPalNormal
	; ld hl, wStatusFlags2
	; res 1, [hl]
	call MaxVolume
	ret


ShowMoveDataFromPokedex:
	call HalfVolume
	call ClearScreen
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a

	
	call ShowNextMoveData
	ld a, [wMenuWatchedKeys]
	ld c, a
	ldh a, [hJoy5]
	ld b, a
	and c
	jr nz, .dontLoop
.waitForButtonPress
	call JoypadLowSensitivity
	ld a, [wMenuWatchedKeys]
	ld c, a
	ldh a, [hJoy5]
	ld b, a
	and c
	jr z, .waitForButtonPress
.dontLoop
	bit B_PAD_B, b
	jr nz, .closeMenu
	jr .waitForButtonPress
.closeMenu
	xor a
	ldh [hClearLetterPrintingDelayFlags], a
	pop af
	ldh [hTileAnimations], a
	call GBPalWhiteOut
	call ClearScreen
	; call RunDefaultPaletteCommand
	; call GBPalNormal
	call MaxVolume
	ld a, 1 ; 1 = indicate we have shown the data page and need to reload more stuff to go back
	and a
	ret

; display the move data itself - if switching between moves with left/right, we don't need to reload the above stuff

ShowNextMoveData:
	; load movedex data page UI tiles
	ld de, MovedexUI
	lb bc, BANK(MovedexUI), 21
	ld hl, vChars1 tile $44
	call CopyVideoDataDouble

	call DrawDataBorder

	ld de, MoveTypeText
	hlcoord 4, 3
	call PlaceString

	ld de, MovePPText
	hlcoord 13, 6
	call PlaceString
	ld de, MovePowerText
	hlcoord 1, 6
	call PlaceString
	ld de, MoveAccuracyText
	hlcoord 1, 8
	call PlaceString
	ld de, MovePercentText
	hlcoord 13, 8
	call PlaceString

	hlcoord 10, 16 ; where the text down arrow should end up flashing at
	ld a, h
	ld [wMenuCursorLocation], a
	ld a, l
	ld [wMenuCursorLocation+1], a
	ld a, [wMovedexMoveID] ; move ID
	push af
	call LoadMoveDexMoveData
	; ld a, [wPlayerMoveType]
	; ld d, a
	; call LoadTypeIcon
	; ld a, [wPlayerMoveType]
	; ld [wCurPartySpecies], a
	; ld b, SET_PAL_MOVEDEX
	; call RunPaletteCommand
	pop af
	ld [wMovedexMoveID], a

	; hlcoord 1, 3
	; ld a, $C0 ; type icon first tile
	; ld [hli], a
	; inc a
	; ld [hl], a
	; inc a
	; hlcoord 1, 4
	; ld [hli], a
	; inc a
	; ld [hl], a
	farcall DetermineMoveCategory
	ld a, [wPlayerMoveCategory]
	cp MOVE_PHYSICAL
	jr z, .physicalAttack
	cp MOVE_SPECIAL
	jr z, .specialAttack
	; ld a, [wPlayerMovePower]
	; and a
	; jr nz, .needsMarker
	ld b, $D5 ; Status icon
	jr .copyMarker
; .needsMarker ;;; is the Move Special or Physical?
; 	ld a, [wPlayerMoveType]
; 	cp SPECIAL ; types >= SPECIAL are all special
; 	ld a, [wPlayerMoveNum]
; 	ld b, a
; 	jr nc, .isSpecialActuallyPhysical
; 	jr .isPhysicalActuallySpecial
; .isSpecialActuallyPhysical
; 	ld hl, SpecialToPhysicalMovesIcon
; .specialPhysicalLoop
; 	ld a, [hli]
; 	cp b
; 	jr z, .physicalAttack
; 	cp $ff ; end of list
; 	jr nz, .specialPhysicalLoop ; keep checking list
; 	jr .specialAttack ; Not actually a physical move
; .isPhysicalActuallySpecial
; 	ld hl, PhysicalToSpecialMovesIcon
; .physicalSpecialLoop
; 	ld a, [hli]
; 	cp b
; 	jr z, .specialAttack ; the physical move is actually special
; 	cp $ff ; end of list
; 	jr nz, .physicalSpecialLoop ; keep checking list
	; fallthrough
.physicalAttack
	ld b, $D1 ; Physical icon
	jr .copyMarker
.specialAttack
	ld b, $CD ; Special icon
	; fallthrough
.copyMarker
	hlcoord 15, 3
	ld c, 4
	ld de, 1
	call DrawTileLineIncrement
; .doneMarker
	call DrawBottomDataBorder

	call GetMoveName
	hlcoord 1, 1
	call PlaceString

; 	hlcoord 14, 1
; 	ld a, "№"
; 	ld [hli], a
; 	ld a, "<DOT>"
; 	ld [hli], a
; 	ld de, wMovedexMoveID
; 	lb bc, LEADING_ZEROES | 1, 3
; 	call PrintNumber ; print move number

	hlcoord 5, 4
	ld d, h
	ld e, l ; de = coordinate to print the type at
	callfar FarPrintType ; print the move type

	hlcoord 7, 6 ; location we will print power number

	ld a, [wPlayerMovePower]
	and a
	ld de, MoveZeroPowerText
	jr z, .zeroPowerMove

	ld a, [wPlayerMoveEffect]
	cp OHKO_EFFECT
	jr z, .OHKO
	cp SPECIAL_DAMAGE_EFFECT
	ld de, MoveQuestionMarkPowerText
	jr z, .specialDamage
	cp SUPER_FANG_EFFECT
	jr z, .specialDamage
	ld de, wPlayerMovePower
	jr .normalMove
.zeroPowerMove
	call PlaceString
	jr .donePrintingPower
.OHKO
	ld de, wSum
	ld a, %11
	ld [de], a
	inc de
	ld a, 231
	ld [de], a
	dec de
	lb bc, LEFT_ALIGN | 2, 3
	call PrintNumber ; print the numeric value for power (999 in this case for OHKO moves)
	jr .donePrintingPower
.specialDamage
	call PlaceString
	jr .donePrintingPower
.normalMove
	lb bc, LEFT_ALIGN | 1, 3
	call PrintNumber ; print the numeric value for power
.donePrintingPower
	
	ld a, [wPlayerMoveAccuracy] ; accuracy value is in 0-255 format, so we need to convert to a percentage with multiplication+division
	ldh [hMultiplicand + 2], a
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, 100
	ldh [hMultiplier], a
	call Multiply
	ld a, 255
	ldh [hDivisor], a
	ld b, 4 ; number of bytes that the dividend can have currently
	call Divide
	ldh a, [hRemainder] ; resultant accuracy percentage
	cp 123
	ldh a, [hQuotient + 3]
	inc_a_nc
	ld de, wSum
	ld [de], a
	hlcoord 10, 8
	lb bc, 1, 3
	call PrintNumber ; print the numeric value for accuracy

	ld de, wPlayerMoveMaxPP
	hlcoord 16, 6
	lb bc, LEFT_ALIGN | 1, 2
	call PrintNumber ; print the numeric value for PP

.printDescription
	; start by storing the buttons we will track while displaying the description
	ld a, PAD_B
	ld b, a
	ld a, [wPokedexDataFlags]
	bit 3, a
	ld a, b ; buttons to watch while displaying the below text
	ld [wMenuWatchedKeys], a

	ld hl, MovedexEntryPointers
	ld a, [wMovedexMoveID]
	dec a
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl] ; de = address of movedex entry

	ld h, d
	ld l, e
	bccoord 1, 11
	ld a, %10
	ldh [hClearLetterPrintingDelayFlags], a

	call TextCommandProcessor ; print movedex description text
	ret


; ; loads the move identified by wMovedexMoveID's properties (power, accuracy, pp, type) into wram
LoadMoveDexMoveData:
	ld de, wPlayerMoveNum
	ld a, [wMovedexMoveID]
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	jp FarCopyData ; copy the move's stats

DrawDataBorder: ; doesn't change between moves
	hlcoord 0, 0
	ld de, 1
	lb bc, $64, SCREEN_WIDTH
	call DrawTileLine ; draw top border

	hlcoord 0, 1
	ld de, 20
	lb bc, $66, $10
	call DrawTileLine ; draw left border

	hlcoord 19, 1
	ld b, $67
	call DrawTileLine ; draw right border

	ld a, $63 ; upper left corner tile
	ldcoord_a 0, 0
	ld a, $65 ; upper right corner tile
	ldcoord_a 19, 0
	ld a, $6c ; lower left corner tile
	ldcoord_a 0, 17
	ld a, $6e ; lower right corner tile
	ldcoord_a 19, 17

	hlcoord 0, 2
	ld de, MovedexTitleDividerLine
	call PlaceString ; draw horizontal divider line
	hlcoord 0, 9
	ld de, MovedexTitleDividerLine
	jp PlaceString ; draw horizontal divider line

DrawBottomDataBorder: ; can change if there's no previous or next move
	hlcoord 4, 17
	ld de, 1
	lb bc, $6f, 12
	call DrawTileLine ; draw bottom border
	hlcoord 1, 17
	ld de, 1
	lb bc, $6f, 3
	call DrawTileLine ; obscure prev button
	hlcoord 1, 16
	lb bc, 1, 3
	call ClearScreenArea ; remove line above it
	hlcoord 16, 17
	ld de, 1
	lb bc, $6f, 3
	call DrawTileLine ; obscure next button
	hlcoord 16, 16
	lb bc, 1, 3
	jp ClearScreenArea ; remove line above it

ClearBasicMoveData:
	hlcoord 1, 1
	lb bc, 1, 13
	call ClearScreenArea
	hlcoord 3, 4
	lb bc, 1, 16
	call ClearScreenArea
	hlcoord 7, 6
	lb bc, 1, 3
	call ClearScreenArea
	hlcoord 16, 6
	lb bc, 1, 2
	call ClearScreenArea
	hlcoord 10, 8
	lb bc, 1, 3
	call ClearScreenArea
	hlcoord 1, 11
	lb bc, 5, 18
	jp ClearScreenArea

INCLUDE "data/moves/movedex_entries.asm"

MoveTypeText:
	db "TYPE/@"

MovePowerText:
	db "POWER:@"

MoveAccuracyText:
	db "ACCURACY:@"

MovePPText:
	db "PP:@"

MoveZeroPowerText:
	db "---@"

MovePercentText:
	db "%@"

MoveQuestionMarkPowerText:
	db "???@"

MovedexTitleDividerLine:
	db $68, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6B, $6A
	db "@"

; MoveDashedLine:
; 	db "-----------@"

