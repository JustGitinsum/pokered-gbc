DisplayPCMainMenu::
	xor a
	ldh [hAutoBGTransferEnabled], a
	call SaveScreenTilesToBuffer2
	ld a, [wNumHoFTeams]
	and a
	jr nz, .leaguePCAvailable
	CheckEvent EVENT_GOT_POKEDEX
	jr z, .noOaksPC
	ld a, [wNumHoFTeams]
	and a
	jr nz, .leaguePCAvailable
	hlcoord 0, 0
	ld b, 8
	ld c, 14
	jr .next
.noOaksPC
	hlcoord 0, 0
	ld b, 6
	ld c, 14
	jr .next
.leaguePCAvailable
	hlcoord 0, 0
	ld b, 10
	ld c, 14
.next
	call TextBoxBorder
	call UpdateSprites
	ld a, 3
	ld [wMaxMenuItem], a
	CheckEvent EVENT_MET_BILL
	jr nz, .metBill
	hlcoord 2, 2
	ld de, SomeonesPCText
	jr .next2
.metBill
	hlcoord 2, 2
	ld de, BillsPCText
.next2
	call PlaceString
	hlcoord 2, 4
	ld de, wPlayerName
	call PlaceString
	ld l, c
	ld h, b
	ld de, PlayersPCText
	call PlaceString
	CheckEvent EVENT_GOT_POKEDEX
	jr z, .noOaksPC2
	hlcoord 2, 6
	ld de, OaksPCText
	call PlaceString
	ld a, [wNumHoFTeams]
	and a
	jr z, .noLeaguePC
	ld a, 4
	ld [wMaxMenuItem], a
	hlcoord 2, 8
	ld de, PKMNLeaguePCText
	call PlaceString
	hlcoord 2, 10
	ld de, LogOffPCText
	jr .next3
.noLeaguePC
	hlcoord 2, 8
	ld de, LogOffPCText
	jr .next3
.noOaksPC2
	ld a, $2
	ld [wMaxMenuItem], a
	hlcoord 2, 6
	ld de, LogOffPCText
.next3
	call PlaceString
	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

SomeonesPCText:   db "SOMEONE's PC@"
BillsPCText:      db "BILL's PC@"
PlayersPCText:    db "'s PC@"
OaksPCText:       db "PROF.OAK's PC@"
PKMNLeaguePCText: db "<PKMN>LEAGUE@"
LogOffPCText:     db "LOG OFF@"

; Entry point for the Bill's PC. Sets up state and enters the main screen; the
; two values pushed here are restored by ExitBillsPC.
BillsPC_::
	xor a
	ldh [hUnusedCoinsByte], a ; no unsaved box change
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	xor a
	ld [wParentMenuItem], a
	inc a               ; MONSTER_NAME
	ld [wNameListType], a
	call LoadHpBarAndStatusTilePatterns
	ld a, [wListScrollOffset]
	push af
	ld a, [wUpdateSpritesEnabled]
	push af
	ld a, $ff ; the list icons use the shadow OAM, so stop overworld sprite updates for the PC session
	ld [wUpdateSpritesEnabled], a
	ld a, [wMiscFlags]
	bit BIT_USING_GENERIC_PC, a
	jr nz, .start
; accessing it directly
	ld a, SFX_TURN_ON_PC
	call PlaySound
	ld hl, SwitchOnText
	call PrintText
.start
	callfar LoadBillsPCExtraTiles
	jp BillsPCMain

; Leaves the PC screen: commits any pending box change, cleans up the display and
; pops the values pushed by BillsPC_. Returns to the caller of BillsPC_.
ExitBillsPC:
	callfar FlushBoxChange
	ld a, [wMiscFlags]
	bit BIT_USING_GENERIC_PC, a
	jr nz, .generic
; accessing it directly
	ld a, SFX_TURN_OFF_PC
	call PlaySound
	call WaitForSoundToFinish
	; the screen backup was reused by the PC screen, so rebuild the map view in one step
	call ReloadMapData ; fills wTileMap with the map view
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	jr .next
.generic
	; blank the list so the caller's tile reload doesn't show it as garbage
	call ClearScreen
.next
	ld hl, wMiscFlags
	res BIT_NO_MENU_BUTTON_SOUND, [hl]
	pop af
	ld [wUpdateSpritesEnabled], a
	call ReloadMapSpriteTilePatterns ; the list icons overwrote the overworld sprite tiles
	pop af
	ld [wListScrollOffset], a
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ret

; Main Bill's PC screen: party list on the left, current box (withdraw) list on the right,
; with CHANGE BOX / SEE YA! in the bottom text box. Every action returns here to redraw.
; wPCDualList values used on this screen:
;   1 = normal, 2 = list switch requested, 3 = skip full redraw on next display,
;   4 = CHANGE BOX chosen, 5 = SEE YA! chosen, 6 = SELECT quick-move (skips the sub-menu)
; wPCListSide: 0 = party list active, 1 = box list active.
; wPCOtherScroll/wPCOtherCursor hold the scroll/cursor of the inactive list.
BillsPCMain:
	xor a
	ld [wPCListSide], a
	ld [wPCOtherScroll], a
	ld [wPCOtherCursor], a
	ld [wListScrollOffset], a
	ld [wPartyAndBillsPCSavedMenuItem], a
	inc a
	ld [wPCDualList], a
.showList
	ld hl, wPartyCount
	ld a, [wPCListSide]
	and a
	ld a, 1 ; depositing
	jr z, .gotList
	ld hl, wBoxCount
	xor a ; withdrawing
.gotList
	ld [wParentMenuItem], a
	call DisplayMonListMenu
	jr nc, .chose
	ld a, [wPCDualList]
	cp 2 ; switching lists?
	jr z, .switchLists
	cp 4 ; CHANGE BOX or SEE YA?
	jr nc, .bottomChoice
	xor a
	ld [wPCDualList], a
	jp ExitBillsPC
.bottomChoice
	push af
	xor a
	ld [wPCDualList], a
	call ClearSprites
	pop af
	cp 5 ; SEE YA?
	jp z, ExitBillsPC
	farcall ChangeBox
	ld b, SET_PAL_OVERWORLD ; undo the generic palette used by the change box menu
	call RunPaletteCommand
	callfar LoadBillsPCExtraTiles
	jp BillsPCMain
.switchLists
	ld a, 3 ; tells DisplayMonListMenu to skip the full redraw
	ld [wPCDualList], a
	ld a, [wPCListSide]
	and a
	jr nz, .doSwitch
	ld a, [wBoxCount]
	and a
	jr z, .showList ; nothing to withdraw
.doSwitch
	ld de, wListScrollOffset
	ld hl, wPCOtherScroll
	call .exchange
	ld de, wPartyAndBillsPCSavedMenuItem
	ld hl, wPCOtherCursor
	call .exchange
	ld a, [wPCListSide]
	xor 1
	ld [wPCListSide], a
	jr .showList
.exchange
	ld a, [de]
	ld b, [hl]
	ld [hl], a
	ld a, b
	ld [de], a
	ret
.chose
	ld a, [wPCListSide]
	and a
	jp nz, .withdrawChosen
	ld a, [wPartyCount]
	dec a
	jr nz, .partyLargeEnough
	ld hl, CantDepositLastMonText
	call PrintTextKeepScreen
	jp .showList
.partyLargeEnough
	ld a, [wBoxCount]
	cp MONS_PER_BOX
	jr nz, .boxNotFull
	ld hl, BoxFullText
	call PrintTextKeepScreen
	jp .showList
.boxNotFull
	ld a, [wPCDualList]
	cp 6
	jr z, .confirmed ; SELECT: deposit without the sub-menu
	call OpenPCSubMenu
	jr c, .confirmed
	jp .showList
.withdrawChosen
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nz, .partyHasRoom
	ld hl, CantTakeMonText
	call PrintTextKeepScreen
	jp .showList
.partyHasRoom
	ld a, [wPCDualList]
	cp 6
	jp z, DoBillsPCWithdraw ; SELECT: withdraw without the sub-menu
	call OpenPCSubMenu
	jp nc, .showList
	jp DoBillsPCWithdraw
.confirmed
	call PCSkipCry
	jr c, .skipDepositCry
	ld a, [wCurPartySpecies]
	call GetCryData
	call PlaySoundWaitForCurrent
.skipDepositCry
	ld a, PARTY_TO_BOX
	ld [wMoveMonType], a
	call MoveMon
	xor a
	ld [wRemoveMonFromBox], a
	call RemovePokemon
	call WaitForSoundToFinish
	ld hl, wBoxNumString
	ld a, [wCurrentBoxNum]
	and $7f
	cp 9
	jr c, .singleDigitBoxNum
	sub 9
	ld [hl], "1"
	inc hl
	add "0"
	jr .next
.singleDigitBoxNum
	add "1"
.next
	ld [hli], a
	ld [hl], "@"
	jp BillsPCMain ; stay on the PC screen

; Returns carry if cries are skipped (Fast text speed).
PCSkipCry:
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	ret nz
	scf
	ret

; Prints hl on the deposit screen, then restores the screen so no redraw is needed.
PrintTextKeepScreen:
	push hl
	call SaveScreenTilesToBuffer2
	pop hl
	call PrintText
	call LoadScreenTilesFromBuffer2
	ld a, 3 ; skip the full redraw
	ld [wPCDualList], a
	ret

; Opens the DEPOSIT/WITHDRAW/STATS box on the deposit screen. Returns carry if an
; option was chosen. On cancel, the list position and screen are restored and the
; next DisplayMonListMenu skips the full redraw.
OpenPCSubMenu:
	ld a, [wListScrollOffset]
	ld b, a
	ld a, [wPartyAndBillsPCSavedMenuItem]
	ld c, a
	push bc
	call DisplayDepositWithdrawMenu
	pop bc
	ld a, b
	ld [wListScrollOffset], a
	ld a, c
	ld [wPartyAndBillsPCSavedMenuItem], a
	jr nc, .cancel
	ld a, [wCurrentMenuItem]
	cp 2 ; RELEASE?
	ret nz ; DEPOSIT/WITHDRAW, carry is still set
	call LoadScreenTilesFromBuffer2
	ld a, [wPCListSide]
	and a
	jr nz, .askRelease
	ld a, [wPartyCount]
	dec a
	jr nz, .askRelease
	ld hl, CantReleaseLastMonText
	call PrintTextKeepScreen
	and a
	ret
.askRelease
	ld hl, OnceReleasedText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr z, .doRelease
.cancel
	call LoadScreenTilesFromBuffer2
	ld a, 3 ; skip the full redraw
	ld [wPCDualList], a
	and a
	ret
.doRelease
	ld a, [wPCListSide]
	ld [wRemoveMonFromBox], a ; 0 = party, 1 = box
	call RemovePokemon
	call PCSkipCry
	jr c, .skipReleaseCry
	call WaitForSoundToFinish
	ld a, [wCurPartySpecies]
	call PlayCry
.skipReleaseCry
	pop hl ; drop this routine's return address and restart the screen, as after a deposit
	jp BillsPCMain

DoBillsPCWithdraw:
	ld a, [wWhichPokemon]
	ld hl, wBoxMonNicks
	call GetPartyMonName
	call PCSkipCry
	jr c, .skipCry
	ld a, [wCurPartySpecies]
	call GetCryData
	call PlaySoundWaitForCurrent
.skipCry
	xor a ; BOX_TO_PARTY
	ld [wMoveMonType], a
	call MoveMon
	ld a, 1
	ld [wRemoveMonFromBox], a
	call RemovePokemon
	call WaitForSoundToFinish
	jp BillsPCMain ; stay on the PC screen, no message

; Sets up and draws the list for the active side (hl = party or box count).
; The first display draws the whole screen; after a list switch (wPCDualList = 3)
; only the list is refreshed.
DisplayMonListMenu:
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld a, [wParentMenuItem]
	and a ; withdrawing?
	ld a, PCWITHDRAWLISTMENU
	jr z, .gotListMenuID
	xor a ; PCPOKEMONLISTMENU
.gotListMenuID
	ld [wListMenuID], a
	ld a, MONSTER_NAME
	ld [wNameListType], a
	ld a, [wPartyAndBillsPCSavedMenuItem]
	ld [wCurrentMenuItem], a
	ld a, [wPCDualList]
	cp 3 ; just switched lists? the screen and icons are already drawn
	jr nz, .fullRedraw
	ld a, 1
	ld [wPCDualList], a
	jr .display
.fullRedraw
	ld a, $ff
	ld [wUnusedCreditsByte], a ; no icons loaded yet
	call ClearScreen ; the list is drawn over a blank screen like the party menu
	hlcoord 0, 12 ; bottom text box holding CHANGE BOX / SEE YA!
	ld b, 4
	ld c, 18
	call TextBoxBorder
	hlcoord 2, 14
	ld de, ChangeBoxSeeYaPCText
	call PlaceString
	decoord 13, 13
	callfar DrawCurrentBoxPrompt
.display
	call DisplayListMenuID
	ld a, [wCurrentMenuItem]
	ld [wPartyAndBillsPCSavedMenuItem], a
	ret


; 	db "BOX No.@"

KnowsHMMove::
; returns whether mon with party index [wWhichPokemon] knows an HM move
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	jr .next
; unreachable
	ld hl, wBoxMon1Moves
	ld bc, wBoxMon2 - wBoxMon1
.next
	ld a, [wWhichPokemon]
	call AddNTimes
	ld b, NUM_MOVES
.loop
	ld a, [hli]
	push hl
	push bc
	ld hl, HMMoveArray
	ld de, 1
	call IsInArray
	pop bc
	pop hl
	ret c
	dec b
	jr nz, .loop
	and a
	ret

HMMoveArray:
INCLUDE "data/moves/hm_moves.asm"

; Draws the DEPOSIT/WITHDRAW, STATS, RELEASE, CANCEL box and handles it.
; Returns carry if DEPOSIT/WITHDRAW/RELEASE was chosen (wCurrentMenuItem 0 or 2).
DisplayDepositWithdrawMenu:
	call SaveScreenTilesToBuffer2 ; lets a cancel restore the screen without a redraw
	hlcoord 9, 8
	lb bc, 8, 9 ; box with DEPOSIT/WITHDRAW, STATS, RELEASE, CANCEL
	call TextBoxBorder
	ld a, [wParentMenuItem]
	and a ; deposit list (1) or withdraw list (0)?
	ld de, DepositPCText
	jr nz, .next
	ld de, WithdrawPCText
.next
	hlcoord 11, 10
	call PlaceString
	ld de, StatsReleaseCancelPCText
	hlcoord 11, 12
	call PlaceString
	ld hl, wTopMenuItemY
	ld a, 10
	ld [hli], a ; wTopMenuItemY
	ld [hli], a ; wTopMenuItemX (also 10)
	xor a
	ld [hli], a ; wCurrentMenuItem
	inc hl
	ld a, 3
	ld [hli], a ; wMaxMenuItem
	ld a, PAD_A | PAD_B
	ld [hli], a ; wMenuWatchedKeys
	xor a
	ld [hl], a ; wLastMenuItem
	ld hl, wListScrollOffset
	ld [hli], a ; wListScrollOffset
	ld [hl], a ; wMenuWatchMovingOutOfBounds
	ld [wPlayerMonNumber], a
	ld [wPartyAndBillsPCSavedMenuItem], a
.loop
	call HandleMenuInput
	bit B_PAD_B, a
	jr nz, .exit
	ld a, [wCurrentMenuItem]
	and a
	jr z, .choseDepositWithdraw
	dec a
	jr z, .viewStats
	ld a, [wCurrentMenuItem]
	cp 2 ; RELEASE?
	jr z, .choseDepositWithdraw
.exit
	and a ; clear carry; the deposit screen keeps its icons
	ret
.choseDepositWithdraw
	scf
	ret
.viewStats
	call ClearSprites
	call SaveScreenTilesToBuffer1
	ld a, [wParentMenuItem]
	and a
	ld a, PLAYER_PARTY_DATA
	jr nz, .next2
	ld a, BOX_DATA
.next2
	ld [wMonDataLocation], a
	predef StatusScreenOriginal
	call LoadScreenTilesFromBuffer1
	ld a, $ff
	ld [wUnusedCreditsByte], a ; the icons were cleared, so reload them
	call ReloadTilesetTilePatterns
	call RunDefaultPaletteCommand
	call LoadGBPal
	callfar LoadBillsPCExtraTiles ; the status screen overwrote the Box Info tiles
	jr .loop

DepositPCText:  db "DEPOSIT@"
WithdrawPCText: db "WITHDRAW@"
StatsReleaseCancelPCText:
	db   "STATS"
	next "RELEASE"
	next "CANCEL@"

ChangeBoxSeeYaPCText:
	db   "CHANGE BOX"
	next "SEE YA!@"

SwitchOnText:
	text_far _SwitchOnText
	text_end

CantDepositLastMonText:
	text_far _CantDepositLastMonText
	text_end

CantReleaseLastMonText:
	text_far _CantReleaseLastMonText
	text_end

BoxFullText:
	text_far _BoxFullText
	text_end

CantTakeMonText:
	text_far _CantTakeMonText
	text_end

OnceReleasedText:
	text_far _OnceReleasedText
	text_end

CableClubLeftGameboy::
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	ret z
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_RIGHT
	ret nz
	ld a, [wCurMap]
	cp TRADE_CENTER
	ld a, LINK_STATE_START_TRADE
	jr z, .next
	inc a ; LINK_STATE_START_BATTLE
.next
	ld [wLinkState], a
	call EnableAutoTextBoxDrawing
	tx_pre_jump JustAMomentText

CableClubRightGameboy::
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ret z
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_LEFT
	ret nz
	ld a, [wCurMap]
	cp TRADE_CENTER
	ld a, LINK_STATE_START_TRADE
	jr z, .next
	inc a ; LINK_STATE_START_BATTLE
.next
	ld [wLinkState], a
	call EnableAutoTextBoxDrawing
	tx_pre_jump JustAMomentText

JustAMomentText::
	text_far _JustAMomentText
	text_end

	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump OpenBillsPCText

OpenBillsPCText::
	script_bills_pc
