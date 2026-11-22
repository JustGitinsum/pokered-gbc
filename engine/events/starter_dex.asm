; Temporarily unlock only the selected preview; never persist preview ownership.
StarterDex:
	ld a, [wPokedexNum]
	push af
	predef IndexToPokedex
	ld a, [wPokedexNum]
	dec a
	ld c, a
	srl a
	srl a
	srl a
	ld e, a
	ld d, 0
	ld hl, wPokedexOwned
	add hl, de
	pop af
	ld [wPokedexNum], a ; ShowPokedexData expects the species ID, not the dex number.
	ld a, [hl]
	push af
	push hl
	ld hl, wPokedexOwned
	ld b, FLAG_SET
	predef FlagActionPredef
	predef ShowPokedexData
	pop hl
	pop af
	ld [hl], a
	ret

PUSHS
SECTION "Nonblocking Cries", ROMX

PlayCryNoWait::
	; Replace cry channels before changing shared modifiers; priority can reject a new cry.
	xor a
	ld [wChannelSoundIDs + CHAN5], a
	ld [wChannelSoundIDs + CHAN6], a
	ld [wChannelSoundIDs + CHAN8], a
	ld a, [wCurPartySpecies]
	call GetCryData
	jp PlaySound

POPS
