HandlePartyMenuSelect::
	push bc
	ld a, SFX_PRESS_AB
	call PlaySound
	ld a, [wMenuItemToSwap]
	and a
	jr nz, .finishPartySwap
	ld a, [wIsInBattle]
	and a
	jr z, .startPartySwap
	; Use the existing swap marker to report the switch and carry to signal it.
	ld a, $ff
	ld [wMenuItemToSwap], a
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	scf
	pop bc
	ret
.startPartySwap
	ld a, [wCurrentMenuItem]
	inc a
	ld [wMenuItemToSwap], a
	ld a, 1 ; ask the home handler to wait for the second Select press
	and a
	pop bc
	ret
.finishPartySwap
	xor a ; continue into the existing party-order swap handling
	pop bc
	ret

HandlePartyMenuStart::
	ld a, [wIsInBattle]
	and a
	jr nz, .battle
	ld a, [wCurrentMenuItem]
	ld [wWhichPokemon], a
	call ClearSprites
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	predef StatusScreenLoop
	ld a, 1
	ld [wPartyMenuStatScreenUsed], a
	; PartyMenuInit and DrawPartyMenu are run by the Home caller: PartyMenuInit
	; switches ROM banks, which would unmap this code before it could return.
	and a ; clear carry: no battle action requested
	ret
.battle
	; Let the battle caller display Status and restore battle graphics.
	ld a, $fe
	ld [wMenuItemToSwap], a
	scf
	ret
