; Unlock full starter previews, preserving every modified owned byte on the stack.
StarterDex:
	ld a, [wPokedexOwned]
	push af
	or 1 << (DEX_BULBASAUR - 1) | 1 << (DEX_IVYSAUR - 1) | 1 << (DEX_CHARMANDER - 1) | 1 << (DEX_SQUIRTLE - 1)
	ld [wPokedexOwned], a
	ld a, [wPokedexOwned + (DEX_ARTICUNO - 1) / 8]
	push af
	or 1 << ((DEX_ARTICUNO - 1) % 8)
	ld [wPokedexOwned + (DEX_ARTICUNO - 1) / 8], a
	ASSERT (DEX_MEW - 1) / 8 == (DEX_MEWTWO - 1) / 8
	ASSERT (DEX_ZAPDOS - 1) / 8 == (DEX_MEW - 1) / 8
	ASSERT (DEX_MOLTRES - 1) / 8 == (DEX_MEW - 1) / 8
	ld hl, wPokedexOwned + (DEX_MEW - 1) / 8
	ld a, [hl]
	push af
	or 1 << ((DEX_MEW - 1) % 8) | 1 << ((DEX_MEWTWO - 1) % 8) | 1 << ((DEX_ZAPDOS - 1) % 8) | 1 << ((DEX_MOLTRES - 1) % 8)
	ld [hl], a
	predef ShowPokedexData
	pop af
	ld [wPokedexOwned + (DEX_MEW - 1) / 8], a
	pop af
	ld [wPokedexOwned + (DEX_ARTICUNO - 1) / 8], a
	pop af
	ld [wPokedexOwned], a
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
