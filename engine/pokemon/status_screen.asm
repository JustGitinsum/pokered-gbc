DrawHP:
; Draws the HP bar in the stats screen
	call GetPredefRegisters
	ld a, $1
	jr DrawHP_

DrawHP2:
; Draws the HP bar in the party screen
	call GetPredefRegisters
	ld a, $2

DrawHP_:
	ld [wHPBarType], a
	push hl
	ld a, [wLoadedMonHP]
	ld b, a
	ld a, [wLoadedMonHP + 1]
	ld c, a
	or b
	jr nz, .nonzeroHP
	xor a
	ld c, a
	ld e, a
	ld a, $6
	ld d, a
	jp .drawHPBarAndPrintFraction
.nonzeroHP
	ld a, [wLoadedMonMaxHP]
	ld d, a
	ld a, [wLoadedMonMaxHP + 1]
	ld e, a
	predef HPBarLength
	ld a, $6
	ld d, a
	ld c, a
.drawHPBarAndPrintFraction
	pop hl
	push de
	push hl
	push hl
	call DrawHPBar
	pop hl
	ldh a, [hUILayoutFlags]
	bit BIT_PARTY_MENU_HP_BAR, a
	jr z, .printFractionBelowBar
	ld bc, $9 ; right of bar
	jr .printFraction
.printFractionBelowBar
	ld bc, SCREEN_WIDTH + 1 ; below bar
.printFraction
	add hl, bc
	call PlaceHPText
	pop hl
	pop de
	ret

PlaceHPText:
	ld de, wLoadedMonHP
	lb bc, 2, 3
	call PrintNumber
	ld a, "/"
	ld [hli], a
	ld de, wLoadedMonMaxHP
	lb bc, 2, 3
	jp PrintNumber

; Predef 0x37
StatusScreen:
	ResetEvent FLAG_STAT_EXP_SHOWING_IN_STATUS_SCREEN
	call StatusScreenLoadMonData
	ld hl, wStatusFlags2
	set BIT_NO_AUDIO_FADE_OUT, [hl]
	ld a, $33
	ldh [rAUDVOL], a ; Reduce the volume
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites
	call LoadHpBarAndStatusTilePatterns
	ld de, BattleHudTiles1  ; source
	ld hl, vChars2 tile $6d ; dest
	lb bc, BANK(BattleHudTiles1), 3
	call CopyVideoDataDouble ; ·│ :L and halfarrow line end
	ld de, BattleHudTiles2
	ld hl, vChars2 tile $78
	lb bc, BANK(BattleHudTiles2), 1
	call CopyVideoDataDouble ; │
	ld de, BattleHudTiles3
	ld hl, vChars2 tile $76
	lb bc, BANK(BattleHudTiles3), 2
	call CopyVideoDataDouble ; ─ ┘
	ld de, PTile
	ld hl, vChars2 tile $72
	lb bc, BANK(PTile), 1
	call CopyVideoDataDouble ; bold P (for PP)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld de, StatExpPrompt
	ld hl, vFont tile 75
	lb bc, BANK(StatExpPrompt), 7
	call CopyVideoDataDouble
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a
	call .drawStatsPage
	call Delay3
	call GBPalNormal
	hlcoord 1, 0
	call LoadFlippedFrontSpriteByMonIndex ; draw Pokémon picture
	call Delay3
	farcall PlayCryNoWait
	pop af
	ret

.drawStatsPage
IF GEN_2_GRAPHICS
	hlcoord 19, 3
	lb bc, 2, 8
ELSE
	hlcoord 19, 1
	lb bc, 6, 10
ENDC
	call DrawLineBox ; Draws the box around name and HP
	hlcoord 2, 7
	ld [hl], "<DOT>"
	dec hl
	ld [hl], "№"
	hlcoord 9, 17
	ld [hl], $76
	dec hl
	ld c, 7
	call DrawLineBox.PrintHorizLine
	hlcoord 1, 9
	ld de, Type1Text
	call PlaceString ; "TYPE1/"
	hlcoord 11, 3
	predef DrawHP
	ld hl, wStatusScreenHPBarColor
	call GetHealthBarColor
	ld b, SET_PAL_STATUS_SCREEN
	call StatusScreenHook ; HAX: Draws EXP bar if GEN_2_GRAPHICS is set
	callfar PrintStatusScreenConditionIcon
	hlcoord 14, 2
	call PrintLevel ; Pokémon level
	ld a, [wMonHIndex]
	ld [wPokedexNum], a
	ld [wCurSpecies], a
	predef IndexToPokedex
	hlcoord 3, 7
	ld de, wPokedexNum
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber ; Pokémon no.
	hlcoord 2, 10
	predef PrintMonType
	hlcoord 2, 10
	ld a, [wMonHType1]
	ld c, $40 ; use unused back-picture tiles; the status screen only loads the front picture
	call PrintStatusTypeIcon
	ld a, [wMonHType1]
	ld b, a
	ld a, [wMonHType2]
	cp b
	jr z, .statusTypeIconsDone
	hlcoord 2, 12
	ld a, [wMonHType2]
	ld c, $48
	call PrintStatusTypeIcon
.statusTypeIconsDone
	ld hl, NamePointers2
	call .GetStringPointer
	call GetLoadedMonDisplayName
	hlcoord 9, 1
	call PlaceString ; Pokémon name
	ld hl, OTPointers
	call .GetStringPointer
	ld d, h
	ld e, l
	hlcoord 2, 16
	call PlaceString ; OT
	hlcoord 2, 14
	ld de, wLoadedMonOTID
	lb bc, LEADING_ZEROES | 2, 5
	call PrintNumber ; ID Number
	ld d, $0
	jp PrintStatsBox

.GetStringPointer
	ld a, [wMonDataLocation]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMonDataLocation]
	cp DAYCARE_DATA
	ret z
	ld a, [wWhichPokemon]
	jp SkipFixedLengthTextEntries

StatusScreenLoadMonData:
	call LoadMonData
	ld a, [wMonDataLocation]
	cp BOX_DATA
	ret c
	ld a, [wLoadedMonBoxLevel]
	ld [wLoadedMonLevel], a
	ld [wCurEnemyLevel], a
	ld hl, wLoadedMonHPExp - 1
	ld de, wLoadedMonStats
	ld b, $1
	jp CalcStats

RestoreStatusScreen:
	call GBPalWhiteOutWithDelay3
	; The moves page replaces loaded experience with the amount to next level.
	call StatusScreenLoadMonData
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 0, 8
	lb bc, 10, 20
	call ClearScreenArea
	hlcoord 8, 0
	lb bc, 8, 12
	call ClearScreenArea
	call StatusScreen.drawStatsPage
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	jp GBPalNormal

; a = type ID, c = first icon tile ID, hl = tile-map destination
PrintStatusTypeIcon:
	push hl
	push bc
	ld d, a
	ld e, c
	farcall LoadTypeIcon8TileAt
	pop bc
	pop hl
	ld b, 8
.loop
	ld a, c
	ld [hli], a
	inc c
	dec b
	jr nz, .loop
	ret

OTPointers:
	dw wPartyMonOT
	dw wEnemyMonOT
	dw wBoxMonOT
	dw wDayCareMonOT

NamePointers2:
	dw wPartyMonNicks
	dw wEnemyMonNicks
	dw wBoxMonNicks
	dw wDayCareMonName

Type1Text:
	db   "TYPE1/"
	next ""
	; fallthrough
Type2Text:
	db   "TYPE2/"
	next ""
	; fallthrough
IDNoText:
	db   "<ID>№/"
	next ""
	; fallthrough
OTText:
	db   "OT/"
	next "@"

; Draws a line starting from hl high b and wide c
DrawLineBox:
	ld de, SCREEN_WIDTH ; New line
.PrintVerticalLine
	ld [hl], $78 ; │
	add hl, de
	dec b
	jr nz, .PrintVerticalLine
	ld [hl], $77 ; ┘
	dec hl
.PrintHorizLine
	ld [hl], $76 ; ─
	dec hl
	dec c
	jr nz, .PrintHorizLine
	ld [hl], $6f ; ← (halfarrow ending)
	ret

PTile: INCBIN "gfx/font/P.1bpp"

PrintStatsBox:
	ld a, d
	and a ; a is 0 from the status screen
	jr nz, .DifferentBox
	hlcoord 10, 6
	lb bc, 10, 8
	call TextBoxBorder ; Draws the box
.default
	push de
	call .PrintPrompt
	hlcoord 11, 7
	ld de, StatusStatsText
	call PlaceString
	pop de
	ld a, d
	cp 2
	jr z, .statExp
	hlcoord 16, 8
	call PrintStatusStatsValues
	call .clearHPRow
	hlcoord 12, 4
	jp PlaceHPText
.DifferentBox
	hlcoord 9, 0
	lb bc, 10, 9
	call TextBoxBorder
	hlcoord 11, 1
	ld de, StatsText
	call PlaceString
	hlcoord 15, 2
	jp PrintStatusStatsValues
.statExp
	hlcoord 11, 8
	lb bc, 2, 5
	ld de, wLoadedMonAttackExp
	call PrintStat
	ld de, wLoadedMonDefenseExp
	call PrintStat
	ld de, wLoadedMonSpclAtkExp
	call PrintStat
	ld de, wLoadedMonSpclDefExp
	call PrintStat
	ld de, wLoadedMonSpeedExp
	call PrintNumber
	push bc
	call .clearHPRow
	pop bc
	hlcoord 11, 4
	ld de, wLoadedMonHPExp
	call PrintNumber
.printDVs
	hlcoord 17, 8
	ld a, [wLoadedMonDVs]
	swap a
	and $f
	call .printDVRow
	ld a, [wLoadedMonDVs]
	and $f
	call .printDVRow
	ld a, [wLoadedMonDVs + 1]
	and $f ; both special stats share one DV
	call .printDVRow
	call .printDVRow
	ld a, [wLoadedMonDVs + 1]
	swap a
	and $f
	call .printDV
	; HP DV consists of the low bits of Attack, Defense, Speed and Special.
	ld a, [wLoadedMonDVs]
	ld b, a
	swap a
	and 1
	ld c, a
	ld a, b
	rrca
	rl c
	ld a, [wLoadedMonDVs + 1]
	ld b, a
	swap a
	rrca
	rl c
	ld a, b
	rrca
	rl c
	ld a, c
	hlcoord 17, 4
	jr .printDV
.printDVRow
	push hl
	push af
	call .printDV
	pop af
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret
.printDV
	ld [hl], " "
	cp 10
	jr c, .printDVOnes
	sub 10
	ld [hl], "1"
.printDVOnes
	inc hl
	add "0"
	ld [hl], a
	ret
.clearHPRow
	hlcoord 11, 4
	lb bc, 1, 8
	jp ClearScreenArea
.PrintPrompt
	ld a, d
	cp 2
	ld hl, .statsPrompt
	jr nz, .copyPrompt
	ld hl, .expPrompt
.copyPrompt
	decoord 11, 6
	ld bc, 8
	jp CopyData
.statsPrompt
	db "─────", $CB, $CC, $CD
.expPrompt
	db "─", $CB, $CC, $CE, $CF, "─", $D0, $D1

PrintStat:
	push hl
	call PrintNumber
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret

PrintStatusStatsValues:
; Display order differs from the stored order: Speed follows both special stats.
	lb bc, 2, 3
	ld de, wLoadedMonAttack
	call PrintStat
	ld de, wLoadedMonDefense
	call PrintStat
	ld de, wLoadedMonSpclAtk
	call PrintStat
	ld de, wLoadedMonSpclDef
	call PrintStat
	ld de, wLoadedMonSpeed
	jp PrintNumber

StatsText:
	db   "ATTACK"
	next "DEFENSE"
	next "SP.ATK"
	next "SP.DEF"
	next "SPEED@"

StatusStatsText:
	db   "Attack"
	next "Defense"
	next "Sp.Atk"
	next "Sp.Def"
	next "Speed@"

StatusScreen2:
	call GBPalWhiteOutWithDelay3
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a
	ldh [hAutoBGTransferEnabled], a
	ld bc, NUM_MOVES + 1
	ld hl, wMoves
	call FillMemory
	ld hl, wLoadedMonMoves
	ld de, wMoves
	ld bc, NUM_MOVES
	call CopyData
	callfar FormatMovesString
	hlcoord 9, 2
	lb bc, 6, 11
	call ClearScreenArea ; Clear under name
	call StatusScreen2Hook
	hlcoord 0, 8
	ld b, 8
	ld c, 18
	call TextBoxBorder ; Draw move container
	hlcoord 2, 9
	ld de, wMovesString
	call PlaceString ; Print moves
	ld a, [wNumMovesMinusOne]
	inc a
	ld c, a
	ld a, $4
	sub c
	ld b, a ; Number of moves ?
	hlcoord 11, 10
	ld de, SCREEN_WIDTH * 2
	ld a, "<BOLD_P>"
	call StatusScreen_PrintPP ; Print "PP"
	ld a, b
	and a
	jr z, .InitPP
	ld c, a
	ld a, "-"
	call StatusScreen_PrintPP ; Fill the rest with --
.InitPP
	ld hl, wLoadedMonMoves
	decoord 14, 10
	ld b, 0
.PrintPP
	ld a, [hli]
	and a
	jr z, .PPDone
	push bc
	push hl
	push de
	ld hl, wCurrentMenuItem
	ld a, [hl]
	push af
	ld a, b
	ld [hl], a
	push hl
	callfar GetMaxPP
	pop hl
	pop af
	ld [hl], a
	pop de
	pop hl
	push hl
	ld bc, wPartyMon1PP - wPartyMon1Moves - 1
	add hl, bc
	ld a, [hl]
	and PP_MASK
	ld [wStatusScreenCurrentPP], a
	push de
	farcall SetStatusScreenPPPalette
	pop de
	ld h, d
	ld l, e
	push hl
	ld de, wStatusScreenCurrentPP
	lb bc, 1, 2
	call PrintNumber
	ld a, "/"
	ld [hli], a
	ld de, wMaxPP
	lb bc, 1, 2
	call PrintNumber
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc b
	ld a, b
	cp $4
	jr nz, .PrintPP
.PPDone
	hlcoord 9, 3
	ld de, StatusScreenExpText
	call PlaceString
	ld a, [wLoadedMonLevel]
	push af
	cp MAX_LEVEL
	jr z, .Level100
	inc a
	ld [wLoadedMonLevel], a ; Increase temporarily if not 100
.Level100
	hlcoord 14, 6
	ld [hl], "<to>"
	inc hl
	inc hl
	call PrintLevel
	pop af
	ld [wLoadedMonLevel], a
	ld de, wLoadedMonExp
	hlcoord 12, 4
	lb bc, 3, 7
	call PrintNumber ; exp
	call CalcExpToLevelUp
	ld de, wLoadedMonExp
	hlcoord 7, 6
	lb bc, 3, 7
	call PrintNumber ; exp needed to level up
	hlcoord 9, 0
	call StatusScreen_ClearName
	hlcoord 9, 1
	call StatusScreen_ClearName
	ld a, [wMonHIndex]
	ld [wNamedObjectIndex], a
	call GetMonName
	hlcoord 9, 1
	call PlaceString
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	call GBPalNormal
	; call WaitForTextScrollButtonPress ; wait for button
	pop af
	; ldh [hTileAnimations], a
	; ld hl, wStatusFlags2
	; res BIT_NO_AUDIO_FADE_OUT, [hl]
	; ld a, $77
	; ldh [rAUDVOL], a
	; call GBPalWhiteOut
	; jp ClearScreen
	ret

CalcExpToLevelUp:
	ld a, [wLoadedMonLevel]
	cp MAX_LEVEL
	jr z, .atMaxLevel
	inc a
	ld d, a
	callfar CalcExperience
	ld hl, wLoadedMonExp + 2
	ldh a, [hExperience + 2]
	sub [hl]
	ld [hld], a
	ldh a, [hExperience + 1]
	sbc [hl]
	ld [hld], a
	ldh a, [hExperience]
	sbc [hl]
	ld [hld], a
	ret
.atMaxLevel
	ld hl, wLoadedMonExp
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

StatusScreenExpText:
	db   "Exp.Points"
	next "Level Up@"

StatusScreen_ClearName:
	ld bc, 10
	ld a, " "
	jp FillMemory

StatusScreen_PrintPP:
; print PP or -- c times, going down two rows each time
	ld [hli], a
	ld [hld], a
	add hl, de
	dec c
	jr nz, StatusScreen_PrintPP
	ret


;;;;;;;;;; PureRGBnote: ADDED: code that allows immediately backing out of the status menu with B from all status menus

StatusScreenOriginal:
	ldh a, [hTileAnimations]
	push af
.displayMon
	call StatusScreen
.continue
	ld b, PAD_A | PAD_B | PAD_SELECT | PAD_START | PAD_RIGHT
	call PokedexStatusWaitForButtonPressLoop
	bit B_PAD_START, a
	jr z, .notStart
	ld a, [wPCDualList]
	and a
	jr z, ExitStatusScreen.select ; outside the PC deposit screen START still toggles the stat data
	callfar ShowLearnsetFromStatus
	jr .displayMon
.notStart
	bit B_PAD_SELECT, a
	jr nz, ExitStatusScreen.select
	ResetEvent FLAG_STAT_EXP_SHOWING_IN_STATUS_SCREEN
	bit B_PAD_B, a
	jr nz, ExitStatusScreen
	call StatusScreen2
	ld b, PAD_A | PAD_B | PAD_LEFT
	call PokedexStatusWaitForButtonPressLoop
	bit B_PAD_LEFT, a
	jr z, ExitStatusScreen
	call RestoreStatusScreen
	jr .continue
ExitStatusScreen:
	pop af
	ldh [hTileAnimations], a
	call MaxVolume
	call GBPalWhiteOut
	jp ClearScreen
.select
	call ToggleStatData
	jr StatusScreenOriginal.continue

;;;;;;;;;; 

;;;;;;;;;; PureRGBnote: ADDED: code that allows going up and down on the dpad
;;;;;;;;;; to next and previous party pokemon while in battle or in the start POKEMON menu.

StatusScreenLoop:
	ldh a, [hTileAnimations]
	push af
.displayNextMon
	call StatusScreen
.continue
	ld a, PAD_A | PAD_B | PAD_SELECT | PAD_START | PAD_RIGHT
	call PokemonStatusWaitForButtonPress
	bit B_PAD_SELECT, a
	jr nz, .changeStatData
	ResetEvent FLAG_STAT_EXP_SHOWING_IN_STATUS_SCREEN
	bit B_PAD_START, a
	jr nz, .learnsetScreen
	bit B_PAD_UP, a
	jr nz, .prevMon
	bit B_PAD_DOWN, a
	jr nz, .nextMon
	bit B_PAD_B, a
	jr nz, .exitStatus
	call StatusScreen2
	ld a, PAD_A | PAD_B | PAD_LEFT
	call PokemonStatusWaitForButtonPress
	bit B_PAD_LEFT, a
	jr nz, .statsPage
	bit B_PAD_UP, a
	jr nz, .prevMon
	bit B_PAD_DOWN, a
	jr nz, .nextMon
.exitStatus
	jp ExitStatusScreen
.statsPage
	call RestoreStatusScreen
	jr .continue
.nextMon
	ld hl, wWhichPokemon
	inc [hl]
	ld hl, wPartyAndBillsPCSavedMenuItem
	inc [hl]
	jr .displayNextMon
.prevMon
	ld hl, wWhichPokemon
	dec [hl]
	ld hl, wPartyAndBillsPCSavedMenuItem
	dec [hl]
	jr .displayNextMon
.changeStatData
	call ToggleStatData
	jr .continue
.learnsetScreen
	callfar ShowLearnsetFromStatus
	; Return to the same Pokemon's status page rather than unwinding to the
	; party menu that originally opened the status screen.
	jr .displayNextMon

ToggleStatData:
	hlcoord 11, 7
	lb bc, 10, 8
	call ClearScreenArea
	ToggleEvent FLAG_STAT_EXP_SHOWING_IN_STATUS_SCREEN
	ld d, 0
	jr z, .drawStats
	ld d, 2
.drawStats
	jp PrintStatsBox.default

PokemonStatusWaitForButtonPress:
.decideButtons
	ld b, a
	ld a, [wWhichPokemon]
	and a
	jr z, .checkRight
	ld a, b
	or PAD_UP
	ld b, a
.checkRight
	ld a, [wPartyCount]
	dec a
	ld c, a
	ld a, [wWhichPokemon]
	cp c
	jr z, PokedexStatusWaitForButtonPressLoop
	ld a, b
	or PAD_DOWN
	ld b, a
PokedexStatusWaitForButtonPressLoop:
.waitForButtonPress
	push bc
	call JoypadLowSensitivity
	pop bc
	ldh a, [hJoy5]
	and b
	jr z, .waitForButtonPress
	ret
