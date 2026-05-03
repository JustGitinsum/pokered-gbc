; Handles Move Tutor functionality
; Costs ¥1000, the same as the Move Relearner
; To make a person a tutor, have their Text Pointer point to a structure like this example

;ExamplePersonScript:
;	text_asm
;	ld a, Move Tutor Number
;	ld [wWhichTrade], a
;	farcall MoveTutorScript
;	jp TextScriptEnd

MoveTutorScript:
; This is used by all other Move Tutors, who only teach one move
	call SaveScreenTilesToBuffer2
	call EnableAutoTextBoxDrawing
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl,MoveTutorWelcomeText
	call PrintText
	ld a,[wWhichTrade] ; which move tutor is this?
	; fallthrough

;DisplayTeachTutorMoveText:
	ld [wPokeBallCaptureCalcTemp],a
	farcall TutorToMove
	ld a,[wPokeBallCaptureCalcTemp]
	ld [wMoveNum],a
	call GetMoveName
	call CopyToStringBuffer ; copy name to CopyToStringBuffer
	ld hl,TeachTutorMoveText
	call PrintText
	coord hl, 14, 7
	ld bc,$080f
	ld a,TWO_OPTION_MENU
	ld [wTextBoxID],a
	call DisplayTextBoxID ; yes/no menu
	ld a,[wCurrentMenuItem]
	and a
	jr z, .CheckMoney
	; chose no
	ld hl,MoveTutorComeAgainText
	jp PrintText

.CheckMoney ; If you said yes, Make sure you have money
	xor a
	;charge 1000 money
	ld [hMoney], a	
	ld [hMoney + 2], a	
	ld a, $0A
	ld [hMoney + 1], a  
	call HasEnoughMoney
	jr nc, .chooseMon ; Go ahead if you have enough
	
	; not enough money
	ld hl, MoveTutorNotEnoughMoneyText
	jp PrintText

.chooseMon
	ld hl, wStringBuffer
	ld de,wTempMoveNameBuffer
	ld bc,14
	call CopyData
	xor a
	ld [wUpdateSpritesEnabled],a
	cp a,$06 ; move tutor party menu
	ld [wPartyMenuTypeOrMessageID],a
	call DisplayPartyMenu
	push af
	ld hl,wTempMoveNameBuffer
	ld de, wStringBuffer
	ld bc,14
	call CopyData
	pop af
	jr nc,.checkIfAlreadyLearnedMove
; if the player cancelled teaching the move
	jr .done

.checkIfAlreadyLearnedMove
	callfar CheckIfMoveIsKnown ; check if the pokemon already knows the move
	jr c,.chooseMon
	predef LearnMove ; teach move
	ld a, b
	and a ; did you learn the move, or cancel learning?
	jr z, .done

	; Charge 1000 money if you learned it
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $0A
	ld [wPriceTemp + 1], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef

.done
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	ld hl,MoveTutorComeAgainText
	jp PrintText

MoveTutorWelcomeText:
	text_far _MoveTutorWelcomeText
	db "@"

TeachTutorMoveText:
	text_far _TeachTutorMoveText
	db "@"

MoveTutorComeAgainText:
	text_far _MoveTutorComeAgainText
	db "@"

MoveTutorNotEnoughMoneyText:
	text_far _MoveTutorNotEnoughMoneyText
	db "@"

TutorToMove:
	ld a, [wTempTMHM]
	dec a
	ld hl, MoveTutorMoves
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wTempTMHM], a
	ret

INCLUDE "data/move_tutors.asm"