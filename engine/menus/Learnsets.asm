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


;---------------------Work in progress-------------------;

LoadLearnsetTiles:
	; call DisableSpriteUpdates
	; load mon's header data into wram
	ld a, [wPokedexNum]
	ld [wCurSpecies], a
	push af
	call GetMonHeader
	call DisableLCD
	ld de, vChars1 tile $57
	ld a, [wPokedexNum]
	ld c, a
	; callfar FarLoadPartyMonSpriteIntoVRAM
	ld hl, LearnsetMonIconsOAM
	ld de, wShadowOAM
	ld bc, 32
	call CopyData
	call EnableLCD
	pop af
	ld [wPokedexNum], a
	; load menu graphics
	ld de, LearnsetMenuUI2BPP
	ld hl, vChars1 tile $40
	lb bc, BANK(LearnsetMenuUI2BPP), 23
	call CopyVideoData
	ld de, LearnsetMenuUI1BPP
	ld hl, vChars2 tile $75
	lb bc, BANK(LearnsetMenuUI1BPP), 6
	call CopyVideoDataDouble
	; draw basic border tiles that will stay the same regardless of page
	hlcoord 0, 4
	lb bc, $CC, 7 
	ld de, 1
	call DrawTileLine
	hlcoord 19, 4
	ld [hl], $CD
	hlcoord 19, 5
	lb bc, $D3, 13
	ld de, SCREEN_WIDTH
	call DrawTileLine
	; draw "(POKEMON)'s"
	call GetMonName
	hlcoord 1, 1
	ld de, wNameBuffer
	call PlaceString
	call FindFirstBlankTile
	; put 's in this blank tile next to the pokemon's name
	ld [hl], "'s"
	ret

ShowMonLearnsetMenu:
	call ClearScreen
	call LoadLearnsetTiles
	xor a
	ld [wLearnsetPage], a
.learnsetList
	ld hl, wTopMenuItemY
	ld a, 5
	ld [hli], a ; top menu item Y
	xor a
	ld [hli], a ; top menu item X
	inc a
	ld [wMenuWatchMovingOutOfBounds], a
	inc hl
	inc hl
	ld a, 6
	ld [hli], a ; max menu item ID
.showLearnsetPage
	; clear page body tiles
	hlcoord 0, 5
	lb bc, 13, 19
	call ClearScreenArea
	; clear the page text description tiles
	hlcoord 11, 2
	ld [hl], " "
	hlcoord 12, 1
	lb bc, 2, 8
	call ClearScreenArea
	xor a
	ld [wListScrollOffset], a
	ld [wCurrentMenuItem], a

.reshowLearnsetPage
	ld a, [wLearnsetPage]
	ld hl, LearnsetViewJumpTable
	call GetAddressFromPointerArray
	jp hl ; was: call hl_caller
	jr c, .showMovedex
	cp 1
	jr z, .changePage
	; call EnableSpriteUpdates
.exitLearnset
	ret
.changePage
	ld a, SFX_LEDGE
	call PlaySound
	jr .showLearnsetPage
.showMovedex
	ld a, [wPokedexNum]
	push af
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	add b
	ld b, 0
	ld c, a
	ld hl, wLearnsetList
	; c = which menu item was chosen
	ld a, [wLearnsetPage]
	and a
	jr nz, .tm
	add hl, bc
	add hl, bc
	inc hl
	ld a, [hl]
	ld [wMovedexMoveID], a
	jr .gotItemID
.tm
	add hl, bc
	ld a, [hl]
	call ConvertTMItemIDToMove
.gotItemID
	; ld hl, wMovedexSeen
	; call IsMoveBitSet
	; jr z, .notSeen
	; call EnableSpriteUpdates
	ld hl, wPokedexDataFlags
	set 3, [hl]
	; call ShowMoveDataExternal
	pop af
	ld [wPokedexNum], a
	call LoadLearnsetTiles
	jr .reshowLearnsetPage
; .notSeen
; 	pop af
; 	ld [wPokedexNum], a
; 	jr .reshowLearnsetPage

LearnsetViewJumpTable:
	dw ShowLevelUpLearnset
	dw ShowTMLearnset
	dw ShowEvolutions
	
PrepLearnsetList:
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 7, 5
	lb bc, 13, 12
	call ClearScreenArea
	hlcoord 1, 5
	ld a, [wListScrollOffset]
	ld [wLearnsetIndex], a
	ld d, 7
	ld a, [wDexLearnsetListCount]
	cp 7
	jr c, .longerList
	ld a, d
	jr .load
.longerList
	ld d, a
.load
	dec a
	ld [wMaxMenuItem], a
	ret
	
	
ShowLevelUpLearnset:
	ld a, PAD_RIGHT | PAD_B | PAD_A
	ld [wMenuWatchedKeys], a
	callfar LoadLevelUpLearnsetIntoWRAM
	hlcoord 7, 3
	ld de, LevelUpLearnsetTabTiles
	call DrawLearnsetTab
	hlcoord 11, 3
	call DrawNonCurrentLearnsetTab
	hlcoord 15, 3
	call DrawNonCurrentLearnsetTab
	hlcoord 11, 1
	ld a, [hli]
	cp " "
	jr z, .notLongName
	inc hl
.notLongName
	ld de, LevelUpText
	call PlaceString
	ld bc, SCREEN_WIDTH - 1
	add hl, bc
	ld de, LearnsetText
	call PlaceString
	; ld a, PAL_CERULEAN
	; ld [wGenericPaletteOverride], a
	; ld b, SET_PAL_GENERIC
	; call RunPaletteCommand
	; call Delay3
.loop
	call PrepLearnsetList
.printMoveEntryLoop
	ld a, [wLearnsetIndex]
	inc a
	ld [wLearnsetIndex], a
	push af
	push de
	push hl
;;;; page specific code starts
	ld de, LvText
	push af
	call PlaceString ; Place "Lv" text
	pop af
	inc hl
	inc hl
	push hl
	; get level the move is learned at into e
	ld hl, wLearnsetList
	ld d, 0
	dec a
	ld e, a
	add hl, de
	add hl, de
	ld a, [hl]
	cp 10
	pop hl
	jr nc, .twoDigit
	ld [hl], " "
	inc hl
	add NUMBER_CHAR_OFFSET
	ld [hli], a
	jr .doneLevel
.twoDigit
	ld de, wStringBuffer
	ld [de], a
	lb bc, LEADING_ZEROES | 1, 2
	call PrintNumber ; print level
.doneLevel
	push hl
	ld a, [wPokedexNum]
	push af
	ld a, [wLearnsetIndex]
	ld hl, wLearnsetList
	ld d, 0
	dec a
	ld e, a
	add hl, de
	add hl, de
	inc hl
;;;; page specific code ends
	ld a, [hl]
    ; ld [wMovedexMoveID], a
	; ld hl, wMovedexSeen
	; call IsMoveBitSet
	; ld de, MoveDashedLine
	; jr z, .skipGettingName 
	call GetMoveName ; if the player has seen the move
.skipGettingName
	pop af
	ld [wPokedexNum], a
	pop hl
	inc hl ; add a space before the move name is printed
	call PlaceString
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop de
	pop af
	ld [wLearnsetIndex], a
	dec d
	jr nz, .printMoveEntryLoop
	ld a, 01
	ldh [hAutoBGTransferEnabled], a
	call GBPalNormal
	call HandleMenuInput
	bit B_PAD_B, a
	jp nz, .buttonBPressed
	bit B_PAD_A, a 
	jp nz, .buttonAPressed
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
	ld a, [wDexLearnsetListCount]
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
.rightPressed 
	ld hl, wLearnsetPage
	inc [hl]
	ld a, 1
	and a
	ret
.checkIfLeftPressed
	bit B_PAD_LEFT, a
	jr z, .buttonAPressed
.leftPressed
	ld hl, wLearnsetPage
	dec [hl]
	ld a, 1
	and a
	ret
.buttonAPressed
	xor a
	scf
	ret
.buttonBPressed
	xor a
	and a
	ret

LvText:
	db "Lv@"

LevelUpText:
	db "LevelUp@"

LearnsetText:
	db "Learnset@"

TMPlusHMText:
	db "TM HM@"

TMLearnsetListPrint:
	push hl
	; get the item ID into 
	ld hl, wLearnsetList
	ld d, 0
	dec a
	ld e, a
	add hl, de
	ld a, [hl]
	ld e, a
	pop hl
	lb bc, LEADING_ZEROES | 1, 3
	jp PrintNumber ; print level

ShowTMLearnset:
	ld a, PAD_LEFT | PAD_RIGHT | PAD_B | PAD_A
	ld [wMenuWatchedKeys], a
	hlcoord 7, 3
	call DrawNonCurrentLearnsetTab
	hlcoord 11, 3
	ld de, TMLearnsetTabTiles
	call DrawLearnsetTab
	hlcoord 15, 3
	call DrawNonCurrentLearnsetTab
	hlcoord 11, 1
	ld a, [hli]
	cp " "
	jr z, .notLongName
	inc hl
.notLongName
	ld de, TMPlusHMText
	call PlaceString
	ld bc, SCREEN_WIDTH - 1
	add hl, bc
	ld de, LearnsetText
	call PlaceString
	; ld a, PAL_CINNABAR
	; ld [wGenericPaletteOverride], a
	; ld b, SET_PAL_GENERIC
	; call RunPaletteCommand
	callfar LoadTMLearnsetIntoWram
	ld a, [wDexLearnsetListCount]
	and a
	jp z, .noTMLearnset
.loop
	call PrepLearnsetList
.printMoveEntryLoop
	ld a, [wLearnsetIndex]
	inc a
	ld [wLearnsetIndex], a
	push af
	push de
	push hl
;;;; page specific code starts
	push hl
	; get level the move is learned at into e
	ld hl, wLearnsetList
	ld d, 0
	dec a
	ld e, a
	add hl, de
	ld d, [hl]
	pop hl
	ld a, [wPokedexNum]
	push af
	ld a, d
	ld [wNamedObjectIndex], a
	push af
	call GetItemName
	call PlaceString
	inc hl
	inc hl
	inc hl
	inc hl
	pop af
	push hl
	call ConvertTMItemIDToMove
;;;; page specific code ends
	; ld hl, wMovedexSeen
	; call IsMoveBitSet
	jr .getMoveName ; if the player has seen the pokemon
	; ld de, MoveDashedLine
	; jr .skipGettingName
.getMoveName
	call GetMoveName
.skipGettingName
	pop hl
	pop af
	ld [wPokedexNum], a
	inc hl ; add a space before the move name is printed
	call PlaceString
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop de
	pop af
	ld [wLearnsetIndex], a
	dec d
	jr nz, .printMoveEntryLoop
	ld a, 01
	ldh [hAutoBGTransferEnabled], a
	call GBPalNormal
	call HandleMenuInput
	bit B_PAD_B, a
	jp nz, CheckPageLeftRight.buttonBPressed
	bit B_PAD_A, a 
	jp nz, CheckPageLeftRight.buttonAPressed
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
	jr z, CheckPageLeftRight
.downPressed ; scroll down one row
	ld a, [wDexLearnsetListCount]
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
.noTMLearnset
	hlcoord 6, 6
	ld de, NoneText
	call PlaceString
	ld hl, wMenuWatchedKeys
	res B_PAD_A, [hl]
	jp ShowEvolutions.waitForButtonPress

CheckPageLeftRight:
.checkIfRightPressed
	bit B_PAD_RIGHT, a
	jr z, .checkIfLeftPressed
.rightPressed 
	ld hl, wLearnsetPage
	inc [hl]
	jr .changedPage
.checkIfLeftPressed
	bit B_PAD_LEFT, a
	jr z, .buttonAPressed
.leftPressed
	ld hl, wLearnsetPage
	dec [hl]
.changedPage
	ld a, 1
	and a
	ret
.buttonAPressed
	xor a
	scf
	ret
.buttonBPressed
	xor a
	and a
	ret

WaysToText:
	db "Ways to@"

EvolveText:
	db "Evolve@"

WithItemText:
	db "with item:@"

TradeText:
	db "by trading@"

AtLevelText:
	db "at Lvl@"

DoesNotText:
	db "Does Not @"

NoneText:
	db "None@"

IntoLearnsetText:
	db "into @"


ShowEvolutions:
	ld a, PAD_LEFT | PAD_B
	ld [wMenuWatchedKeys], a
	hlcoord 7, 3
	call DrawNonCurrentLearnsetTab
	hlcoord 11, 3
	call DrawNonCurrentLearnsetTab
	hlcoord 15, 3
	ld de, EvoTabTiles
	call DrawLearnsetTab
	hlcoord 11, 1
	ld a, [hli]
	cp " "
	jr z, .notLongName
	inc hl
.notLongName
	ld de, WaysToText
	call PlaceString
	hlcoord 13, 2
	call .printEvolveText
	; ld a, PAL_LAVENDER
	; ld [wGenericPaletteOverride], a
	; ld b, SET_PAL_GENERIC
	; call RunPaletteCommand
	callfar LoadEvosIntoWram
	ld a, [wDexLearnsetListCount]
	and a
	jp z, .doesNotEvolve
	ld b, a
	push bc
	hlcoord 0, 5
	call .drawSeparator
	pop bc
	ld de, wLearnsetList
.drawEvosLoop
	ld a, [wPokedexNum]
	push af
	push bc
	push de
	call .printEvolveText
	call FindFirstBlankTile
	ld [hl], "s"
	inc hl
	inc hl
	pop de
	ld a, [de]
	push de
	dec a ; EVOLVE_LEVEL
	jr z, .level
	dec a
	jr z, .item
.trade
	ld de, TradeText
	call PlaceString
	pop de
	inc de
	push de
	ld bc, SCREEN_WIDTH - 5
	jr .evoName
.item
	ld de, WithItemText
	call PlaceString
	ld bc, 15
	add hl, bc
	pop de
	inc de
	ld a, [de]
	inc de
	ld [wNamedObjectIndex], a
	push de
	call GetItemName
	call PlaceString
	ld bc, 0
	jr .evoName
.level
	ld de, AtLevelText
	call PlaceString
	pop de
	inc de
	ld a, [de]
	push de
	ld de, wStringBuffer
	ld [de], a
	ld bc, 6
	add hl, bc
	lb bc, LEADING_ZEROES | 1, 2
	call PrintNumber ; print level
	ld bc, 7
.evoName
	add hl, bc
	call .nextLine
	ld de, IntoLearnsetText
	call PlaceString
	ld bc, 5
	add hl, bc
	pop de
	inc de
	ld a, [de]
	push de
	ld [wNamedObjectIndex], a
	push hl
	push hl
	; check if the evolution has been seen before
	push af
	call IndexToPokedex
	ld hl, wPokedexSeen
	call IsPokemonBitSet
	pop hl ; af into hl to preserve flags
	ld a, h
	ld [wNamedObjectIndex], a
	; if not dont show its name
	pop hl
	ld [hl], "?"
	jr z, .skipGetName
	; otherwise show its name
	call GetMonName
	call PlaceString
.skipGetName
	pop hl
.doneEvoEntryGoToNext
	ld bc, SCREEN_WIDTH - 9
	add hl, bc
	call .drawSeparator
	pop de
	inc de
	pop bc
	pop af
	ld [wPokedexNum], a
	dec b
	jp nz, .drawEvosLoop
.waitForButtonPress
	call JoypadLowSensitivity
	ld a, [wMenuWatchedKeys]
	ld c, a
	ldh a, [hJoy5]
	and c
	jr z, .waitForButtonPress
	bit B_PAD_B, a
	jp nz, CheckPageLeftRight.buttonBPressed
	jp CheckPageLeftRight
.doesNotEvolve
	hlcoord 1, 6
	ld de, DoesNotText
	call PlaceString
	hlcoord 10, 6
	call .printEvolveText
	jr .waitForButtonPress
.nextLine
	ld bc, SCREEN_WIDTH
	add hl, bc
	ret
.drawSeparator
	ld de, 1
	lb bc, $6B, 19 
	call DrawTileLine
	inc hl
	inc hl ; move to the next line's start
	ret
.printEvolveText
	ld de, EvolveText
	jp PlaceString



NonCurrentLearnsetTabTiles:
	db $D0, $D1, $D1, $D2
	db $D5, $D6, $D6, $CA

LevelUpLearnsetTabTiles:
	db $C0, $C1, $C2, $C3
	db $CB, $75, $76, $CE

TMLearnsetTabTiles:
	db $C4, $C5, $C6, $C3
	db $CF, $77, $78, $CE

EvoTabTiles:
	db $C4, $C7, $C8, $C9
	db $CF, $79, $7A, $D4

DrawNonCurrentLearnsetTab:
	ld de, NonCurrentLearnsetTabTiles
; input hl = top left coord
; input de = 8 tiles to draw
DrawLearnsetTab:
	push hl
	ld b, 4
	call .drawTiles
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld b, 4
	; fall through
.drawTiles
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .drawTiles
	ret

; input hl = coordinate to start horizontal search at
FindFirstMonNameBlankTile:
	hlcoord 1,1
FindFirstBlankTile:
.loop
	; we're still at hlcoord 1,1
	; after printing the name keep iterating the coord horizontally until we hit a blank space
	ld a, [hli]
	cp " "
	jr nz, .loop
	dec hl
	ret

LearnsetMonIconsOAM:
	db 32,16,$D7,$00
	db 32,24,$D8,$00
	db 40,16,$DB,$00
	db 40,24,$DC,$00

	db 32,40,$D9,$00
	db 32,48,$DA,$00
	db 40,40,$DD,$00
	db 40,48,$DE,$00

ConvertTMItemIDToMove:
	; convert item ID to tm or hm index (HMs come after TMs in the index whereas they come before them in item IDs)
	cp $C4 + NUM_HMS
	jr nc, .tm
	add NUM_TMS
	jr .gotItemID
.tm
	sub NUM_HMS
.gotItemID
	sub $C3 ; TM/HM item offset - 1 since the below function expects the first TM to start at 1 not 0
	ld [wTempTMHM], a
	jpfar TMToMove
	ret

; SetPokemonLearnsetUnlocked::
; 	ld b, FLAG_SET
; 	jr LearnsetFlagAction
; IsPokemonLearnsetUnlocked:
; 	call AreLearnsetsEnabled
; 	ret z
; IsPokemonLearnsetUnlockedDirect::
; 	ld b, FLAG_TEST
; LearnsetFlagAction:
; 	ld hl, PokemonFamilyMapping
; 	ld a, [wPokedexNum]
; 	dec a
; 	ld d, 0
; 	ld e, a
; 	add hl, de
; 	ld a, [hl] ; a = pokedex family number
; 	ld hl, wLearnsetFlags
; 	ld c, a
; 	predef FlagActionPredef
; 	ld a, c
; 	and a ; has pokemon learnset been unlocked?
; 	ret

