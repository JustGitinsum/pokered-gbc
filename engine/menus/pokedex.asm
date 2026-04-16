ShowPokedexMenu:
	call GBPalWhiteOut
	call ClearScreen
	call UpdateSprites
	ld a, [wListScrollOffset]
	push af
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	ld [wLastMenuItem], a
	inc a
	ld [wPokedexNum], a
	ldh [hJoy7], a
.setUpGraphics
	ld b, SET_PAL_GENERIC
	call RunPaletteCommand
	callfar LoadPokedexTilePatterns
.doPokemonListMenu
	ld hl, wTopMenuItemY
	ld a, 3
	ld [hli], a ; top menu item Y
	xor a
	ld [hli], a ; top menu item X
	inc a
	ld [wMenuWatchMovingOutOfBounds], a
	inc hl
	inc hl
	ld a, 6
	ld [hli], a ; max menu item ID
	ld [hl], PAD_LEFT | PAD_RIGHT | PAD_B | PAD_A
	call HandlePokedexListMenu
	jr c, .goToSideMenu ; if the player chose a pokemon from the list
.exitPokedex
	xor a
	ld [wMenuWatchMovingOutOfBounds], a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ldh [hJoy7], a
	ld [wUnusedOverrideSimulatedJoypadStatesIndex], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	pop af
	ld [wListScrollOffset], a
	call GBPalWhiteOutWithDelay3
	call RunDefaultPaletteCommand
	jp ReloadMapData
.goToSideMenu
	call HandlePokedexSideMenu
	dec b
	jr z, .exitPokedex ; if the player chose Quit
	dec b
	jr z, .doPokemonListMenu ; if pokemon not seen or player pressed B button
	jp .setUpGraphics ; if pokemon data or area was shown

; handles the menu on the lower right in the pokedex screen
; OUTPUT:
; b = reason for exiting menu
; 00: showed pokemon data or area
; 01: the player chose Quit
; 02: the pokemon has not been seen yet or the player pressed the B button
HandlePokedexSideMenu:
	call PlaceUnfilledArrowMenuCursor
	ld a, [wCurrentMenuItem]
	push af
	ld b, a
	ld a, [wLastMenuItem]
	push af
	ld a, [wListScrollOffset]
	push af
	add b
	inc a
	ld [wPokedexNum], a
	ld a, [wPokedexNum]
	push af
	ld a, [wDexMaxSeenMon]
	push af ; this doesn't need to be preserved
	ld hl, wPokedexSeen
	call IsPokemonBitSet
	ld b, 2
	jr z, .exitSideMenu
	call PokedexToIndex
	ld hl, wTopMenuItemY
	ld a, 10
	ld [hli], a ; top menu item Y
	ld a, 15
	ld [hli], a ; top menu item X
	xor a
	ld [hli], a ; current menu item ID
	inc hl
	ld a, 3
	ld [hli], a ; max menu item ID
	;ld a, PAD_A | PAD_B
	ld [hli], a ; menu watched keys (A button and B button)
	xor a
	ld [hli], a ; old menu item ID
	ld [wMenuWatchMovingOutOfBounds], a
.handleMenuInput
	call HandleMenuInput
	bit B_PAD_B, a
	ld b, 2
	jr nz, .buttonBPressed
	ld a, [wCurrentMenuItem]
	and a
	jr z, .choseData
	dec a
	jr z, .choseCry
	dec a
	jr z, .choseArea
.choseQuit
	ld b, 1
.exitSideMenu
	pop af
	ld [wDexMaxSeenMon], a
	pop af
	ld [wPokedexNum], a
	pop af
	ld [wListScrollOffset], a
	pop af
	ld [wLastMenuItem], a
	pop af
	ld [wCurrentMenuItem], a
	push bc
	hlcoord 0, 3
	ld de, 20
	lb bc, " ", 13
	call DrawTileLine ; cover up the menu cursor in the pokemon list
	pop bc
	ret

.buttonBPressed
	push bc
	hlcoord 15, 10
	ld de, 20
	lb bc, " ", 7
	call DrawTileLine ; cover up the menu cursor in the side menu
	pop bc
	jr .exitSideMenu

.choseData
	call ShowPokedexDataInternal
	ld b, 0
	jr .exitSideMenu

; play pokemon cry
.choseCry
	; ld a, [wPokedexNum]
	; call GetCryData
	; call PlaySound
	; jr .handleMenuInput
	call ShowPokedexInfo
	ld b, 0
	jr .exitSideMenu

.choseArea
	predef LoadTownMap_Nest ; display pokemon areas
	ld b, 0
	jr .exitSideMenu

; handles the list of pokemon on the left of the pokedex screen
; sets carry flag if player presses A, unsets carry flag if player presses B
HandlePokedexListMenu:
	xor a
	ldh [hAutoBGTransferEnabled], a
; draw the horizontal line separating the seen and owned amounts from the menu
	hlcoord 15, 8
	ld a, "─"
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	hlcoord 14, 0
	ld [hl], $71 ; vertical line tile
	hlcoord 14, 1
	call DrawPokedexVerticalLine
	hlcoord 14, 9
	call DrawPokedexVerticalLine
	ld hl, wPokedexSeen
	ld b, wPokedexSeenEnd - wPokedexSeen
	call CountSetBits
	ld de, wNumSetBits
	hlcoord 16, 3
	lb bc, 1, 3
	call PrintNumber ; print number of seen pokemon
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld de, wNumSetBits
	hlcoord 16, 6
	lb bc, 1, 3
	call PrintNumber ; print number of owned pokemon
	hlcoord 16, 2
	ld de, PokedexSeenText
	call PlaceString
	hlcoord 16, 5
	ld de, PokedexOwnText
	call PlaceString
	hlcoord 1, 1
	ld de, PokedexContentsText
	call PlaceString
	hlcoord 16, 10
	ld de, PokedexMenuItemsText
	call PlaceString
; find the highest pokedex number among the pokemon the player has seen
	ld hl, wPokedexSeenEnd - 1
	ld b, (wPokedexSeenEnd - wPokedexSeen) * 8 + 1
.maxSeenPokemonLoop
	ld a, [hld]
	ld c, 8
.maxSeenPokemonInnerLoop
	dec b
	sla a
	jr c, .storeMaxSeenPokemon
	dec c
	jr nz, .maxSeenPokemonInnerLoop
	jr .maxSeenPokemonLoop

.storeMaxSeenPokemon
	ld a, b
	ld [wDexMaxSeenMon], a
.loop
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 4, 2
	lb bc, 14, 10
	call ClearScreenArea
	hlcoord 1, 3
	ld a, [wListScrollOffset]
	ld [wPokedexNum], a
	ld d, 7
	ld a, [wDexMaxSeenMon]
	cp 7
	jr nc, .printPokemonLoop
	ld d, a
	dec a
	ld [wMaxMenuItem], a
; loop to print pokemon pokedex numbers and names
; if the player has owned the pokemon, it puts a pokeball beside the name
.printPokemonLoop
	ld a, [wPokedexNum]
	inc a
	ld [wPokedexNum], a
	push af
	push de
	push hl
	ld de, -SCREEN_WIDTH
	add hl, de
	ld de, wPokedexNum
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber
	ld de, SCREEN_WIDTH
	add hl, de
	dec hl
	push hl
	ld hl, wPokedexOwned
	call IsPokemonBitSet
	pop hl
	ld a, " "
	jr z, .writeTile
	ld a, $72 ; pokeball tile
.writeTile
	ld [hl], a ; put a pokeball next to pokemon that the player has owned
	push hl
	ld hl, wPokedexSeen
	call IsPokemonBitSet
	jr nz, .getPokemonName ; if the player has seen the pokemon
	ld de, .dashedLine ; print a dashed line in place of the name if the player hasn't seen the pokemon
	jr .skipGettingName
.dashedLine ; for unseen pokemon in the list
	db "----------@"
.getPokemonName
	call PokedexToIndex
	call GetMonName
.skipGettingName
	pop hl
	inc hl
	call PlaceString
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop de
	pop af
	ld [wPokedexNum], a
	dec d
	jr nz, .printPokemonLoop
	ld a, 01
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	call GBPalNormal
	call HandleMenuInput
	bit B_PAD_B, a
	jp nz, .buttonBPressed
.checkIfUpPressed
	bit B_PAD_UP, a
	jr z, .checkIfDownPressed
.upPressed ; scroll up one row
	ld a, [wListScrollOffset]
	and a
	jp z, .loop
	dec a
	ld [wListScrollOffset], a
	jp .loop
.checkIfDownPressed
	bit B_PAD_DOWN, a
	jr z, .checkIfRightPressed
.downPressed ; scroll down one row
	ld a, [wDexMaxSeenMon]
	cp 7
	jp c, .loop ; can't if the list is shorter than 7
	sub 7
	ld b, a
	ld a, [wListScrollOffset]
	cp b
	jp z, .loop
	inc a
	ld [wListScrollOffset], a
	jp .loop
.checkIfRightPressed
	bit B_PAD_RIGHT, a
	jr z, .checkIfLeftPressed
.rightPressed ; scroll down 7 rows
	ld a, [wDexMaxSeenMon]
	cp 7
	jp c, .loop ; can't if the list is shorter than 7
	sub 6
	ld b, a
	ld a, [wListScrollOffset]
	add 7
	ld [wListScrollOffset], a
	cp b
	jp c, .loop
	dec b
	ld a, b
	ld [wListScrollOffset], a
	jp .loop
.checkIfLeftPressed ; scroll up 7 rows
	bit B_PAD_LEFT, a
	jr z, .buttonAPressed
.leftPressed
	ld a, [wListScrollOffset]
	sub 7
	ld [wListScrollOffset], a
	jp nc, .loop
	xor a
	ld [wListScrollOffset], a
	jp .loop
.buttonAPressed
	scf
	ret
.buttonBPressed
	and a
	ret

DrawPokedexVerticalLine:
	ld c, 9 ; height of line
	ld de, SCREEN_WIDTH
	ld a, $71 ; vertical line tile
.loop
	ld [hl], a
	add hl, de
	xor 1 ; toggle between vertical line tile and box tile
	dec c
	jr nz, .loop
	ret

PokedexSeenText:
	db "SEEN@"

PokedexOwnText:
	db "OWN@"

PokedexContentsText:
	db "CONTENTS@"

PokedexMenuItemsText:
	db   "DATA"
	next "EVO"
	next "AREA"
	next "QUIT@"

; tests if a pokemon's bit is set in the seen or owned pokemon bit fields
; INPUT:
; [wPokedexNum] = pokedex number
; hl = address of bit field
IsPokemonBitSet:
	ld a, [wPokedexNum]
	dec a
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	ret

; function to display pokedex data from outside the pokedex
ShowPokedexData:
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites
	callfar LoadPokedexTilePatterns ; load pokedex tiles

; function to display pokedex data from inside the pokedex
ShowPokedexDataInternal:
	ld hl, wStatusFlags2
	set BIT_NO_AUDIO_FADE_OUT, [hl]
	ld a, $33 ; 3/7 volume
	ldh [rAUDVOL], a
	call GBPalWhiteOut ; zero all palettes
	call ClearScreen
	ld a, [wPokedexNum]
	ld [wCurPartySpecies], a
	push af
	ld b, SET_PAL_POKEDEX
	call RunPaletteCommand
	pop af
	ld [wPokedexNum], a
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a

	hlcoord 0, 0
	ld de, 1
	lb bc, $64, SCREEN_WIDTH
	call DrawTileLine ; draw top border

	hlcoord 0, 17
	ld b, $6f
	call DrawTileLine ; draw bottom border

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

	hlcoord 0, 9
	ld de, PokedexDataDividerLine
	call PlaceString ; draw horizontal divider line

	hlcoord 9, 6
	ld de, HeightWeightText
	call PlaceString

	call GetMonName
	hlcoord 9, 2
	call PlaceString

	ld hl, PokedexEntryPointers
	ld a, [wPokedexNum]
	dec a
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl] ; de = address of pokedex entry

	hlcoord 9, 4
	call PlaceString ; print species name

	ld h, b
	ld l, c
	push de
	ld a, [wPokedexNum]
	push af
	call IndexToPokedex

	hlcoord 2, 8
	ld a, "№"
	ld [hli], a
	ld a, "<DOT>"
	ld [hli], a
	ld de, wPokedexNum
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber ; print pokedex number

	ld hl, wPokedexOwned
	call IsPokemonBitSet
	pop af
	ld [wPokedexNum], a
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	pop de

	push af
	push bc
	push de
	push hl

	call Delay3
	call GBPalNormal
	call GetMonHeader ; load pokemon picture location
	hlcoord 1, 1
	call LoadFlippedFrontSpriteByMonIndex ; draw pokemon picture
	ld a, [wCurPartySpecies]
	call PlayCry

	pop hl
	pop de
	pop bc
	pop af

	ld a, c
	and a
	jp z, .waitForButtonPress ; if the pokemon has not been owned, don't print the height, weight, or description
	inc de ; de = address of feet (height)
	ld a, [de] ; reads feet, but a is overwritten without being used
	hlcoord 12, 6
	lb bc, 1, 2
	call PrintNumber ; print feet (height)
	ld a, "′"
	ld [hl], a
	inc de
	inc de ; de = address of inches (height)
	hlcoord 15, 6
	lb bc, LEADING_ZEROES | 1, 2
	call PrintNumber ; print inches (height)
	ld a, "″"
	ld [hl], a
; now print the weight (note that weight is stored in tenths of pounds internally)
	inc de
	inc de
	inc de ; de = address of upper byte of weight
	push de
; put weight in big-endian order at hDexWeight
	ld hl, hDexWeight
	ld a, [hl] ; save existing value of [hDexWeight]
	push af
	ld a, [de] ; a = upper byte of weight
	ld [hli], a ; store upper byte of weight in [hDexWeight]
	ld a, [hl] ; save existing value of [hDexWeight + 1]
	push af
	dec de
	ld a, [de] ; a = lower byte of weight
	ld [hl], a ; store lower byte of weight in [hDexWeight + 1]
	ld de, hDexWeight
	hlcoord 11, 8
	lb bc, 2, 5 ; 2 bytes, 5 digits
	call PrintNumber ; print weight
	hlcoord 14, 8
	ldh a, [hDexWeight + 1]
	sub 10
	ldh a, [hDexWeight]
	sbc 0
	jr nc, .next
	ld [hl], "0" ; if the weight is less than 10, put a 0 before the decimal point
.next
	inc hl
	ld a, [hli]
	ld [hld], a ; make space for the decimal point by moving the last digit forward one tile
	ld [hl], "<DOT>" ; decimal point tile
	pop af
	ldh [hDexWeight + 1], a ; restore original value of [hDexWeight + 1]
	pop af
	ldh [hDexWeight], a ; restore original value of [hDexWeight]
	pop hl
	inc hl ; hl = address of pokedex description text
	bccoord 1, 11
	ld a, %10
	ldh [hClearLetterPrintingDelayFlags], a
	call TextCommandProcessor ; print pokedex description text
	xor a
	ldh [hClearLetterPrintingDelayFlags], a
.waitForButtonPress
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and PAD_A | PAD_B
	jr z, .waitForButtonPress
	pop af
	ldh [hTileAnimations], a
	call GBPalWhiteOut
	call ClearScreen
	call RunDefaultPaletteCommand
	call LoadTextBoxTilePatterns
	call GBPalNormal
	ld hl, wStatusFlags2
	res BIT_NO_AUDIO_FADE_OUT, [hl]
	ld a, $77 ; max volume
	ldh [rAUDVOL], a
	ret

; new for evos and learnsets
ShowPokedexInfo: ; TBE
	ld hl, wStatusFlags2
	set 1, [hl]
	ld a, $33 ; 3/7 volume
	ldh [rAUDVOL], a
	ldh a, [hTileAnimations]

	push af
	xor a
	ldh [hTileAnimations], a
	call GBPalWhiteOut ; zero all palettes

	ld a, [wPokedexNum] ; pokemon ID
	ld [wCurPartySpecies], a
	push af
	ld b, SET_PAL_POKEDEX
	call RunPaletteCommand
	pop af
	ld [wPokedexNum], a

;	ld hl, wPokedexOwned
;	call IsPokemonBitSet ; info in z flag
;	jr z, .printUnknownInfo

	call DrawMonInfoOnScreen

.waitForButtonPress
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and PAD_A | PAD_B
	jr z, .waitForButtonPress

	pop af
	ldh [hTileAnimations], a
	call GBPalWhiteOut
	call ClearScreen
	call RunDefaultPaletteCommand
	call LoadTextBoxTilePatterns
	call GBPalNormal
	ld hl, wStatusFlags2
	res 1, [hl]
	ld a, $77 ; max volume
	ldh [rAUDVOL], a
	ret

HeightWeightText:
	db   "HT  ?′??″"
	next "WT   ???lb@"

; XXX does anything point to this?
PokeText:
	db "#@"

; horizontal line that divides the pokedex text description from the rest of the data
PokedexDataDividerLine:
	db $68, $69, $6B, $69, $6B, $69, $6B, $69, $6B, $6B
	db $6B, $6B, $69, $6B, $69, $6B, $69, $6B, $69, $6A
	db "@"

; draws a line of tiles
; INPUT:
; b = tile ID
; c = number of tile ID's to write
; de = amount to destination address after each tile (1 for horizontal, 20 for vertical)
; hl = destination address
DrawTileLine:
	push bc
	push de
.loop
	ld [hl], b
	add hl, de
	dec c
	jr nz, .loop
	pop de
	pop bc
	ret

INCLUDE "data/pokemon/dex_entries.asm"

; new ==========================================================

DrawMonInfoOnScreen:

	call DrawPokedexBordersForInfoPages

	call GBPalNormal

	
; 	ld hl, wPokedexOwned
; 	call IsPokemonBitSet
; 	jr nz, .pokemonOwned

; ; pokemon not owned
; 	call GetMonName
; 	hlcoord 1, 1
; 	call PlaceString
; 	ld h, b
; 	ld l, c
; 	ld de, InfoText
; 	call PlaceString
; 	hlcoord 3, 4
; 	ld de, InfoWhenOwnedText
; 	jp PlaceString

.pokemonOwned

	call PrintEvoInfo

; .waitForButtonPress1
; 	call JoypadLowSensitivity
; 	ldh a, [hJoy5]
; 	and PAD_A | PAD_B
; 	jr z, .waitForButtonPress1

; 	call PrintLevelUpMovesInfo

; .waitForButtonPress2
; 	call JoypadLowSensitivity
; 	ldh a, [hJoy5]
; 	and PAD_A | PAD_B
; 	jr z, .waitForButtonPress2

; 	call PrintTMHMsMovesInfo

; .waitForButtonPress3
; 	call JoypadLowSensitivity
; 	ldh a, [hJoy5]
; 	and PAD_A | PAD_B
; 	jr z, .waitForButtonPress3

; 	call PrintBaseStatsInfo

	ret

; ----------------------------------------------------------

MonsEvolutionsText:
	db "'s EVOs@"

InfoText:
	db "'s INFO@"

InfoWhenOwnedText:
	db   "INFO AVAILABLE"
	next "  WHEN OWNED@"

PrintEvoInfo:

	hlcoord 1, 1
	ld a, h
	ld [wEphemerealTempBuffer2ByteStorage], a
	ld a, l
	ld [wEphemerealTempBuffer2ByteStorage+1], a

	call GetMonName
	hlcoord 1, 1
	call PlaceString
	ld h, b
	ld l, c
	ld de, MonsEvolutionsText
	call PlaceString

; is this Eevee?
	ld a, [wPokedexNum]
	cp EEVEE
	jr nz, .evolutionsVisible

	hlcoord 1, 4
	ld de, EeveeDedicatedEvoListText1
	call PlaceString
	hlcoord 1, 5
	ld de, EeveeDedicatedEvoListText2
	call PlaceString
	hlcoord 1, 6
	ld de, EeveeDedicatedEvoListText3
	call PlaceString
	hlcoord 1, 7
	ld de, EeveeDedicatedEvoListText4
	call PlaceString
	hlcoord 1, 8
	ld de, EeveeDedicatedEvoListText5
	call PlaceString
	hlcoord 1, 9
	ld de, EeveeDedicatedEvoListText6
	call PlaceString
	hlcoord 1, 10
	ld de, EeveeDedicatedEvoListText7
	call PlaceString
	hlcoord 1, 11
	ld de, EeveeDedicatedEvoListText8
	call PlaceString

	call SetHLToEvosMovesPointer
; hl +32
	ld b, 0
	ld c, 32
	add hl, bc
	ret

.evolutionsVisible

	call SetHLToEvosMovesPointer

.nextEvoEntry
	push hl ; stack start address for evolution moves (this will be later updated with the next entry)

	ld de, wBuffer
	ld a, BANK(EvosMovesPointerTable)
	ld bc, 4 * 3 + 1 ; 4 bytes, as currently the biggest entry for an evolution is 4 bytes
	call FarCopyData ; wBuffer now has a copy of first evo entry

	ld hl, wBuffer
	ld a, [hli]
	and a ; reached terminator?
	jr nz, .noTerminator
; we reached the end
	jp .concludeEvoLoop

.noTerminator
	push hl
	push af
	SetEvent EVENT_AT_LEAST_ONE_EVOLUTION_TO_PRINT_IN_DEX
	call IncreaseHLCoordinatesBy1Row
	pop af
	pop hl
	cp EVOLVE_ITEM
	jr z, .handleItem ; is it an item evolution?
	cp EVOLVE_LEVEL
	jr z, .handleLevel

.handleTrade
	inc hl
	push hl
	call IncreaseHLCoordinatesBy2Row
	ld de, ViaTradeText
	call PlaceString
	call PrintColonRightAfterString

	call SaveValueOfwPokedexNum
	pop hl
	ld a, [hl] ; a contains the evolved form
	ld [wPokedexNum], a
	call GetMonName
	call GetIndentedHLCoordinates
	call PlaceString
	call RestoreValueOfwPokedexNum

	jr .progressWithChecks3Bytes

.handleLevel
	ld a, [hli] ; a contains the level at which the mons evolve
	            ; hl now points to the mon it evolves into
	push hl
	ld [wUniQuizAnswer], a
	call IncreaseHLCoordinatesBy2Row
	ld de, ArrowLevelText
	call PlaceString
	ld h, b
	ld l, c
	push hl
	ld de, wUniQuizAnswer
	lb bc, 1, 2
	call PrintNumber
	pop hl
	call PrintColonRightAfterNumberAtDEStartingAtHL

	call SaveValueOfwPokedexNum
	pop hl
	ld a, [hl] ; a contains the evolved form
	ld [wPokedexNum], a
	call GetMonName
	call GetIndentedHLCoordinates
	call PlaceString
	call RestoreValueOfwPokedexNum

	jr .progressWithChecks3Bytes

.handleItem
	call SaveValueOfwPokedexNum

	ld a, [hli] ; a contains the item with which the mon evolves
	            ; hl now points to 1 (because... yes)
	inc hl
	push hl
	ld [wPokedexNum], a

	ld de, ArrowText
	call IncreaseHLCoordinatesBy2Row
	call PlaceString
	ld h, b
	ld l, c
	push hl
	call GetItemName ; given an item ID at [wPokedexNum], store the name of the item into a string starting at wNameBuffer
	ld de, wNameBuffer
	pop hl
	call PlaceString
	call PrintColonRightAfterString

	pop hl ; now hl points to the mon it evolves into
	ld a, [hl] ; a contains the evolved form
	ld [wPokedexNum], a
	call GetMonName
	call GetIndentedHLCoordinates
	call PlaceString
	call RestoreValueOfwPokedexNum

	jr .progressWithChecks4Bytes

.progressWithChecks3Bytes
	pop hl
	jr .continueWithProgress

.progressWithChecks4Bytes
	pop hl
	inc hl

.continueWithProgress
	inc hl
	inc hl
	inc hl ; hl now holds the address to the next evo entry
	jp .nextEvoEntry ; we have the address, load next entry to wBuffer

.concludeEvoLoop
	CheckAndResetEvent EVENT_AT_LEAST_ONE_EVOLUTION_TO_PRINT_IN_DEX
	jr nz, .popAndRet
	hlcoord 3, 4
	ld de, UnableToEvolveText
	call PlaceString
.popAndRet
	pop hl
	ret

UnableToEvolveText:
	db "CANNOT EVOLVE@"

EeveeDedicatedEvoListText1:
	db "▷FIRES: FLAREON@"
EeveeDedicatedEvoListText2:
	db "▷THUNDERS: JOLTEON@"
EeveeDedicatedEvoListText3:
	db "▷WATERS: VAPOREON@"
EeveeDedicatedEvoListText4:
	db "▷SUNS: ESPEON@"
EeveeDedicatedEvoListText5:
	db "▷MOONS: UMBREON@"
EeveeDedicatedEvoListText6:
	db "▷LEAFS: LEAFEON@"
EeveeDedicatedEvoListText7:
	db "▷ICES: GLACEON@"
EeveeDedicatedEvoListText8:
	db "▷KING's R: SYLVEON@"

ViaTradeText:
	db "▷ VIA TRADE@"

ArrowLevelText:
	db "▷ LV @"

ArrowText:
	db "▷ @"

SaveValueOfwPokedexNum:
	ld a, [wPokedexNum]
	ld [wMultipurposeTemporaryStorage], a
	ret

RestoreValueOfwPokedexNum:
	ld a, [wMultipurposeTemporaryStorage]
	ld [wPokedexNum], a
	ret

IncreaseHLCoordinatesBy2Row:
	ld a, [wEphemerealTempBuffer2ByteStorage]
	ld h, a
	ld a, [wEphemerealTempBuffer2ByteStorage+1]
	ld l, a
	ld bc, SCREEN_WIDTH * 2
	add hl, bc
	ld a, h
	ld [wEphemerealTempBuffer2ByteStorage], a
	ld a, l
	ld [wEphemerealTempBuffer2ByteStorage+1], a
	ret

IncreaseHLCoordinatesBy1Row:
	ld a, [wEphemerealTempBuffer2ByteStorage]
	ld h, a
	ld a, [wEphemerealTempBuffer2ByteStorage+1]
	ld l, a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld a, h
	ld [wEphemerealTempBuffer2ByteStorage], a
	ld a, l
	ld [wEphemerealTempBuffer2ByteStorage+1], a
	ret

GetIndentedHLCoordinates:
	ld a, [wEphemerealTempBuffer2ByteStorage]
	ld h, a
	ld a, [wEphemerealTempBuffer2ByteStorage+1]
	ld l, a
	ld bc, SCREEN_WIDTH
	add hl, bc
	inc hl
	inc hl
	ret

PrintColonRightAfterString:
	ld h, b
	ld l, c
	ld de, ColonText
	jp PlaceString

PrintColonRightAfterNumberAtDEStartingAtHL:
	ld a, [de]
	cp 10
	jr c, .small
	cp 100
	jr nz, .medium
.big
	inc hl
.medium
	inc hl
.small
	inc hl
	inc hl
	ld de, ColonText
	jp PlaceString

ColonText:
	db ":@"

.endOfLoop

	pop bc
	ld a, b
	ld [wPokedexNum], a

	pop hl
	pop de
	pop bc
	ret

SetHLToEvosMovesPointer:
	ld hl, EvosMovesPointerTable
	ld b, 0
	ld a, [wPokedexNum]
	ld [wLoadedMonSpecies], a
	dec a
	add a
	rl b
	ld c, a
	add hl, bc
	ld de, wBuffer
	ld a, BANK(EvosMovesPointerTable)
	ld bc, 2
	call FarCopyData ; wBuffer has the address to evomoves list
	ld hl, wBuffer
	ld a, [hli]
	ld h, [hl]
	ld l, a ; at this point hl has the address for this pokémon's evomoves list
	ret

; ----------------------------------------------------------

DrawPokedexBordersForInfoPages:
	call ClearScreen

	hlcoord 0, 0
	ld de, 1
	lb bc, $64, SCREEN_WIDTH
	call DrawTileLine ; draw top border

	hlcoord 0, 17
	ld b, $6f
	call DrawTileLine ; draw bottom border

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
	ld de, PokedexDataDividerLine
	jp PlaceString ; draw horizontal divider line



PokedexToIndex:
	; converts the Pokédex number at [wPokedexNum] to an index
	push bc
	push hl
	ld a, [wPokedexNum]
	ld b, a
	ld c, 0
	ld hl, PokedexOrder

.loop ; go through the list until we find an entry with a matching dex number
	inc c
	ld a, [hli]
	cp b
	jr nz, .loop

	ld a, c
	ld [wPokedexNum], a
	pop hl
	pop bc
	ret

IndexToPokedex:
	; converts the index number at [wPokedexNum] to a Pokédex number
	push bc
	push hl
	ld a, [wPokedexNum]
	dec a
	ld hl, PokedexOrder
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wPokedexNum], a
	pop hl
	pop bc
	ret

INCLUDE "data/pokemon/dex_order.asm"
