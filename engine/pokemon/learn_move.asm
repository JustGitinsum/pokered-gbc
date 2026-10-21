LearnMove:
	call SaveScreenTilesToBuffer1
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, wNameBuffer
	ld de, wLearnMoveMonName
	ld bc, NAME_LENGTH
	call CopyData

DontAbandonLearning:
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2Moves - wPartyMon1Moves
	ld a, [wWhichPokemon]
	call AddNTimes
	ld d, h
	ld e, l
	ld b, NUM_MOVES
.findEmptyMoveSlotLoop
	ld a, [hl]
	and a
	jr z, .next
	inc hl
	dec b
	jr nz, .findEmptyMoveSlotLoop
	push de
	call TryingToLearn
	pop de
	jp c, AbandonLearning
	push hl
	push de
	ld [wNamedObjectIndex], a
	call GetMoveName
	ld hl, OneTwoAndText
	call PrintText
	pop de
	pop hl
.next
	ld a, [wMoveNum]
	ld [hl], a
	ld bc, wPartyMon1PP - wPartyMon1Moves
	add hl, bc
	push hl
	push de
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wBuffer
	ld a, BANK(Moves)
	call FarCopyData
	ld a, [wBuffer + 5] ; a = move's max PP
	pop de
	pop hl
	ld [hl], a
	ld a, [wIsInBattle]
	and a
	jp z, PrintLearnedMove
	ld a, [wWhichPokemon]
	ld b, a
	ld a, [wPlayerMonNumber]
	cp b
	jp nz, PrintLearnedMove
	ld h, d
	ld l, e
	ld de, wBattleMonMoves
	ld bc, NUM_MOVES
	call CopyData
	ld bc, wPartyMon1PP - wPartyMon1OTID
	add hl, bc
	ld de, wBattleMonPP
	ld bc, NUM_MOVES
	call CopyData
	jp PrintLearnedMove

AbandonLearning:
	; ld hl, AbandonLearningText
	; call PrintText
	; hlcoord 14, 7
	; lb bc, 8, 15
	; ld a, TWO_OPTION_MENU
	; ld [wTextBoxID], a
	; call DisplayTextBoxID ; yes/no menu
	; ld a, [wCurrentMenuItem]
	; and a
	; jp nz, DontAbandonLearning
	ld hl, DidNotLearnText
	call PrintText
	ld b, 0
	ret

PrintLearnedMove:
	ld hl, LearnedMove1Text
	call PrintText
	ld b, 1
	ret

TryingToLearn:
	push hl
; print dialogue box
	ld hl, TryingToLearnText
	call PrintText
; place Yes No menu
	hlcoord 14, 7
	lb bc, 8, 15
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; yes/no menu
; retrieve hl
	pop hl
; check decision
	ld a, [wCurrentMenuItem]
	rra
	ret c

; we decided to learn the new move	
	ld bc, -NUM_MOVES
	add hl, bc
	push hl
	ld de, wMoves
	ld bc, NUM_MOVES
	call CopyData
	callfar FormatMovesString
	pop hl
.loop
	push hl
	call ClearScreen
	hlcoord 3, 0
	lb bc, 1, 15
	call TextBoxBorder
	ld a, [wMoveNum]
	ld [wNamedObjectIndex], a
	call GetMoveName
	hlcoord 5, 1
	call PlaceString
	hlcoord 3, 3
	lb bc, 7, 15
	call TextBoxBorder
	ld de, wMovesString
	ld hl, hUILayoutFlags
	res BIT_SINGLE_SPACED_LINES, [hl]
	res BIT_DOUBLE_SPACED_MENU, [hl]
	hlcoord 5, 4
	call PlaceString
	ld hl, wTopMenuItemY
	ld a, 1
	ld [hli], a ; wTopMenuItemY
	ld a, 4
	ld [hli], a ; wTopMenuItemX
	xor a
	ld [hli], a ; wCurrentMenuItem
	inc hl
	ld a, [wNumMovesMinusOne]
	inc a ; item 0 is the new move; items 1-4 are the known moves
	ld [hli], a ; wMaxMenuItem
	ld a, PAD_A | PAD_B | PAD_DOWN | PAD_UP
	ld [hli], a ; wMenuWatchedKeys
	ld [hl], 0 ; wLastMenuItem

	call PrintInfoCurrentMove
.inputLoop
	call HandleMenuInput
	push af
	call EraseMenuCursor
	; Known moves start one extra row below the new move.
	ld a, [wCurrentMenuItem]
	and a
	ld a, 1
	jr z, .placeCursor
	inc a
.placeCursor
	ld [wTopMenuItemY], a
	call PlaceMenuCursor
	pop af
	bit B_PAD_B, a
	jr nz, .doTheThings
	bit B_PAD_A, a
	jr nz, .selectMove
	and PAD_UP | PAD_DOWN
	jr nz, .updateBox
	jr .inputLoop
.updateBox
	call PrintInfoCurrentMove
	jr .inputLoop
.selectMove
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .selectOldMove
	farcall RestoreItemDescriptionPalettes
	ld a, [wMoveNum]
	ld [wNamedObjectIndex], a
	call GetMoveName
	ld hl, wNameBuffer
	ld de, wStringBuffer
	ld bc, NAME_BUFFER_LENGTH
	call CopyData
	ld hl, WhichMoveToForgetText
	call PrintText
	jr .inputLoop
.selectOldMove
	ld a, PAD_A
.doTheThings
	push af
	farcall RestoreItemMenuPalettes
	call LoadScreenTilesFromBuffer1
	pop af
	pop hl
	bit B_PAD_B, a
	jr nz, .cancel
	push hl
	ld a, [wCurrentMenuItem]
	dec a ; convert the menu item to the party move slot
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl] ; move ID
	push af
	push bc
	call IsMoveHM
	pop bc
	pop de
	ld a, d
	jr c, .hm
	pop hl
	add hl, bc
	and a
	ret
.hm
	ld hl, HMCantDeleteText
	call PrintText
	pop hl
	jp .loop
.cancel
	scf
	ret

LearnedMove1Text:
	text_far _LearnedMove1Text
	sound_get_item_1 ; plays SFX_GET_ITEM_1 in the party menu (rare candy) and plays SFX_LEVEL_UP in battle
	text_promptbutton
	text_end

WhichMoveToForgetText:
	text_far _WhichMoveToForgetText
	text_end

AbandonLearningText:
	text_far _AbandonLearningText
	text_end

DidNotLearnText:
	text_far _DidNotLearnText
	text_end

TryingToLearnText:
	text_far _TryingToLearnText
	text_end

OneTwoAndText:
	text_far _OneTwoAndText
	text_pause
	text_asm
	ld a, SFX_SWAP
	call PlaySoundWaitForCurrent
	ld hl, PoofText
	ret

PoofText:
	text_far _PoofText
	text_pause
ForgotAndText:
	text_far _ForgotAndText
	text_end

HMCantDeleteText:
	text_far _HMCantDeleteText
	text_end

PrintInfoCurrentMove:
	ld a, [wCurrentMenuItem]
	and a
	ld a, [wMoveNum]
	jr z, .display
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wWhichPokemon]
	call AddNTimes
	ld a, [wCurrentMenuItem]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
.display
	ld [wPlayerMoveNum], a
	farjp DisplayMoveDescription
