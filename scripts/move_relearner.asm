MoveRelearnerText1:
	text_asm
	ld hl, MoveRelearnerGreetingText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .exit
	ld hl, MoveRelearnerSaidYesText
	call PrintText
	; Select pokemon from party.
	call SaveScreenTilesToBuffer2
	xor a
	ld [wListScrollOffset], a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wUpdateSpritesEnabled], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	jp c, .exit
	ld a, [wWhichPokemon]
	ld b, a
	push bc
.prepareMoves
	ld hl, PrepareRelearnableMoveList
	ld b, Bank(PrepareRelearnableMoveList)
	call Bankswitch
	ld a, [wMoveBuffer]
	and a
	jr nz, .chooseMove
	pop bc
	ld hl, MoveRelearnerNoMovesText
	call PrintText
	jp TextScriptEnd
.chooseMove
	ld hl, MoveRelearnerWhichMoveText
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, MOVESLISTMENU
	ld [wListMenuID], a
	ld de, wMoveBuffer
	ld hl, wListPointer
	ld [hl], e
	inc hl
	ld [hl], d
	xor a
	ld [wPrintItemPrices], a ; don't print prices
	call DisplayListMenuID
	push af
	farcall RestoreItemMenuPalettes
	pop af
	pop bc
	jr c, .exit  ; exit if player chose cancel
	push bc
	; Save the selected move id.
	ld a, [wCurListMenuItem] ;ld a, [wcf91]
	ld [wMoveNum], a
	ld [wPokeBallCaptureCalcTemp],a ;ld [wd11e],a
	call GetMoveName
	call CopyToStringBuffer ; copy name to CopyToStringBuffer
	pop bc
	ld a, b
	ld [wWhichPokemon], a
	push bc
	ld a, [wLetterPrintingDelayFlags]
	push af
	xor a
	ld [wLetterPrintingDelayFlags], a
	predef LearnMove
	pop af
	ld [wLetterPrintingDelayFlags], a
	ld a, b
	and a
	pop bc
	jr nz, .exit
	ld a, b
	ld [wWhichPokemon], a
	push bc
	jp .prepareMoves
.exit
	ld hl, MoveRelearnerByeText
	call PrintText
	jp TextScriptEnd


MoveRelearnerGreetingText:
	text_far _MoveRelearnerGreetingText
	text_end

MoveRelearnerSaidYesText:
	text_far _MoveRelearnerSaidYesText
	text_end

MoveRelearnerWhichMoveText:
	text_far _MoveRelearnerWhichMoveText
	text_end

MoveRelearnerByeText:
	text_far _MoveRelearnerByeText
	text_end

MoveRelearnerNoMovesText:
	text_far _MoveRelearnerNoMovesText
	text_end