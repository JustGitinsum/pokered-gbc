; Move Tutors
; Each tutor's move, price, compatible species and texts are defined in data/move_tutors.asm.
; To make a person a tutor, point their text pointer at a script like this:
;
;ExamplePersonScript:
;	text_asm
;	ld a, TUTOR_SWIFT ; see constants/move_tutor_constants.asm
;	ld [wWhichTrade], a
;	farcall MoveTutorScript
;	jp TextScriptEnd

MoveTutorScript::
	call SaveScreenTilesToBuffer2 ; before the money box, so .done removes it again
	call EnableAutoTextBoxDrawing
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	; wWhichTrade shares RAM with other data, so the tutor id is kept on the stack
	; for the whole script and popped in .printTutorTextAndExit
	ld a, [wWhichTrade]
	push af

	; the intro only plays the first time the tutor is spoken to after entering the map
	ld a, [wCurMap]
	ld hl, wMoveTutorIntroMap
	cp [hl]
	jr z, .skipIntro
	ld [hl], a
	pop af
	push af
	ld de, MOVE_TUTOR_INTRO_TEXT
	call PrintMoveTutorText
.skipIntro

	; "Pay ¥<price> to learn <move>?"
	pop af
	push af
	call GetMoveTutorEntry
	ASSERT MOVE_TUTOR_MOVE == 0
	ld a, [hl]
	ld [wMoveNum], a
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyToStringBuffer
	pop af
	push af
	call LoadMoveTutorPrice
	ld hl, TeachTutorMoveText
	call PrintText
	call InitYesNoTextBoxParameters
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, [wCurrentMenuItem]
	and a
	ld de, MOVE_TUTOR_GOODBYE_TEXT
	jr nz, .printTutorTextAndExit ; chose NO

	call HasEnoughMoney ; hMoney was set by LoadMoveTutorPrice above
	ld de, MOVE_TUTOR_NO_MONEY_TEXT
	jr c, .printTutorTextAndExit

.chooseMon
	; DisplayPartyMenu overwrites wStringBuffer, which holds the move name
	ld hl, wStringBuffer
	ld de, wTempMoveNameBuffer
	ld bc, 14
	call CopyData
	xor a
	ld [wUpdateSpritesEnabled], a
	ld a, MOVE_TUTOR_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	call DisplayPartyMenu
	push af
	ld hl, wTempMoveNameBuffer
	ld de, wStringBuffer
	ld bc, 14
	call CopyData
	pop af
	jr c, .done ; cancelled

	call CanLearnTutorMove
	jr c, .checkIfAlreadyLearnedMove
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld a, SFX_DENIED
	call PlaySoundWaitForCurrent
	ld hl, MoveTutorCannotLearnText
	call PrintText
	jr .chooseMon

.checkIfAlreadyLearnedMove
	callfar CheckIfMoveIsKnown
	jr c, .chooseMon
	predef LearnMove
	ld a, b
	and a ; did the mon learn the move, or did the player cancel?
	jr z, .done

	; only charge once the move is learned; wPriceTemp shares RAM with other data,
	; so reload the price after the party menu and LearnMove
	pop af
	push af
	call LoadMoveTutorPrice
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, 3
	predef SubBCDPredef

.done
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	ld de, MOVE_TUTOR_GOODBYE_TEXT
.printTutorTextAndExit
	pop af ; tutor id
	; fallthrough

; input: a = tutor id, de = MOVE_TUTOR_*_TEXT field offset
PrintMoveTutorText:
	call GetMoveTutorEntry
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp PrintText

; Called on every map load (from MarkTownVisitedAndLoadMissableObjects).
; Forgets the shown intro when entering a different map; reloading the same map
; (e.g. after a battle) keeps it, so the intro doesn't replay.
ResetMoveTutorIntrosOnMapChange::
	ld a, [wCurMap]
	ld hl, wMoveTutorIntroMap
	cp [hl]
	ret z
	ld [hl], -1 ; no valid map id
	ret

; input: a = tutor id
; output: hl = MoveTutorData entry
GetMoveTutorEntry:
	dec a
	ld hl, MoveTutorData
	ld bc, MOVE_TUTOR_DATA_LENGTH
	jp AddNTimes

; input: a = tutor id
; copies the tutor's price to wPriceTemp (text, SubBCD) and hMoney (HasEnoughMoney)
LoadMoveTutorPrice:
	call GetMoveTutorEntry
	ASSERT MOVE_TUTOR_PRICE == 1
	inc hl
	ld a, [hli]
	ld [wPriceTemp], a
	ldh [hMoney], a
	ld a, [hli]
	ld [wPriceTemp + 1], a
	ldh [hMoney + 1], a
	ld a, [hl]
	ld [wPriceTemp + 2], a
	ldh [hMoney + 2], a
	ret

; tests if mon [wCurPartySpecies] can learn tutor move [wMoveNum]
; output: carry set if it can
CanLearnTutorMove::
	ld a, [wMoveNum]
	ld b, a
	ld hl, MoveTutorData
	ld de, MOVE_TUTOR_DATA_LENGTH
.findMove
	ld a, [hl]
	cp b
	jr z, .foundMove
	inc a ; reached the -1 terminator?
	jr z, .result ; a = 0: not a tutor move, can't learn
	add hl, de
	jr .findMove
.foundMove
	ld de, MOVE_TUTOR_MODE
	add hl, de
	ld a, [hli]
	ld c, a
	ASSERT MOVE_TUTOR_SPECIES == MOVE_TUTOR_MODE + 1
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCurPartySpecies]
	ld b, a
.findSpecies
	ld a, [hli]
	cp b
	jr z, .listed
	inc a ; reached the -1 terminator?
	jr nz, .findSpecies
	; not listed: can learn only if TUTOR_EXCEPT
	ld a, c
	jr .result
.listed
	; listed: can learn only if TUTOR_ONLY
	ld a, c
	xor 1
.result
	ASSERT TUTOR_ONLY == 0 && TUTOR_EXCEPT == 1
	rra ; bit 0 (1 = can learn) -> carry
	ret

TeachTutorMoveText:
	text_far _TeachTutorMoveText
	text_end

MoveTutorCannotLearnText:
	text_far _MonCannotLearnMachineMoveText
	text_end

; declares a text pointer Foo that prints _Foo (see text/move_tutor.asm)
MACRO move_tutor_text
\1:
	text_far _\1
	text_end
ENDM

	; generic texts, used by tutors that don't specify their own
	move_tutor_text MoveTutorWelcomeText
	move_tutor_text MoveTutorComeAgainText
	move_tutor_text MoveTutorNotEnoughMoneyText

INCLUDE "data/move_tutors.asm"
