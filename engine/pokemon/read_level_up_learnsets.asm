DEF MAX_LEARNSET_LENGTH EQU 27

GetLearnsetPointerInHL:
	ld hl, EvosMovesPointerTable
	ld a, [wPokedexNum]
	dec a
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	hl_deref
	ret

; Loads level up learnset into wram, 2 bytes for each move, 1st one = level it's learned, 2nd one = which move
; due to the size of wram space, max learnset length will be 27 moves. Should be sufficient.
; presumes mon header is already loaded which we need for starting moves
LoadLevelUpLearnsetIntoWRAM:
	ld de, wLearnsetList
	; first load starting moves with level = 0 from already loaded mon header
	ld hl, wMonHMoves
	ld b, NUM_MOVES
	ld c, 0 ; c = length of learnset
.loopMonHeaderMoves
	ld a, [hli]
	cp NO_MOVE
	jr z, .doNotLoad
	inc de
	ld [de], a
	dec de
	xor a
	ld [de], a
	inc de
	inc de
	inc c
.doNotLoad
	dec b
	jr nz, .loopMonHeaderMoves
	push bc
	call GetLearnsetPointerInHL
	pop bc
	; skip past evos to learnset
.loopSkipEvos
	ld a, [hli]
	and a
	jr nz, .loopSkipEvos
	push hl
	; fall through
.getLengthLoop
	ld a, [hli]
	and a
	jr z, .doneGetLength
	inc hl
	inc c
	jr .getLengthLoop
.doneGetLength
	; b is still 0 from earlier
	pop hl
	ld a, c
	cp MAX_LEARNSET_LENGTH + 1
	ret z ; don't copy anything if the learnset is too long
	ld [wDexLearnsetListCount], a
	add a ; 2 bytes per move
	ld c, a
	call CopyData
	; TODO: end byte = 0?
	ret
	
LoadEvosIntoWram:
	ld de, wLearnsetList
	call GetLearnsetPointerInHL
	ld c, 0; length of list
.getLengthLoop
	ld a, [hli]
	and a
	jr z, .doneGetLength
	ld [de], a
	inc de
	cp EVOLVE_ITEM
	ld b, 2
	jr nz, .innerLoop
	; item evos have an extra byte of data
	inc b
.innerLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .innerLoop
	inc c
	jr .getLengthLoop
.doneGetLength
	ld a, c
	ld [wDexLearnsetListCount], a
	ret
	
; Load TM Learnset into wram, 1 byte per move that is learnable, byte value = TM/HM item ID
LoadTMLearnsetIntoWram:
	ld a, [wPokedexNum] 
	push af
	; mon header already presumed to be loaded
	ld de, wLearnsetList
	ld hl, TechnicalMachines
	ld b, 0 ; which TM we're on
	ld c, 0 ; how many learnable TMs in this learnset
.loop
	; load total length of TMs+HMs
	ld a, [hli]
	ld [wMoveNum], a
	push hl
	push bc
	push de
	call CanLearnTMBody
	ld a, c
	pop de
	pop bc
	pop hl
	and a
	jr z, .notLearnable
	ld a, b
	cp NUM_TMS
	jr c, .tm
	sub NUM_TMS ; hm item ids are before TMs
	jr .gotItemID
.tm
	add NUM_HMS
.gotItemID
	add $C4 ; TM item ID offset
	ld [de], a
	inc de
	inc c
.notLearnable
	inc b
	ld a, b
	cp NUM_HMS + NUM_TMS
	assert (NUM_HMS + NUM_TMS) < 56
	jr nz, .loop
	ld a, c
	ld [wDexLearnsetListCount], a
	pop af
	ld [wPokedexNum], a 
	ret

