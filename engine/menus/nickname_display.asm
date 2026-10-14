; C = party/box index (zero for day care), HL = nickname-list base.
; Return DE = wNameBuffer without changing stored nicknames.
GetPartyMonDisplayName::
	ld a, [wOptions]
	bit BIT_HIDE_NICKNAMES, a
	jr z, .copyNickname
	; Select the species list corresponding to the nickname-list base.
	ld a, l
	cp LOW(wPartyMonNicks)
	jr nz, .box
	ld a, h
	cp HIGH(wPartyMonNicks)
	jr nz, .box
	ld hl, wPartySpecies
	jr .species
.box
	ld a, l
	cp LOW(wBoxMonNicks)
	jr nz, .enemy
	ld a, h
	cp HIGH(wBoxMonNicks)
	jr nz, .enemy
	ld hl, wBoxSpecies
	jr .species
.enemy
	ld a, l
	cp LOW(wEnemyMonNicks)
	jr nz, .daycare
	ld a, h
	cp HIGH(wEnemyMonNicks)
	jr nz, .daycare
	ld hl, wEnemyPartySpecies
.species
	ld b, 0
	add hl, bc
	ld a, [hl]
	jr .display
.daycare
	ld a, [wDayCareMonSpecies]
.display
	ld c, a
	; The species lookup already returns wNameBuffer; do not copy it onto itself.
	jp GetSpeciesDisplayName
.copyNickname
	ld a, c
	call SkipFixedLengthTextEntries
	ld de, wNameBuffer
	push de
	ld bc, NAME_LENGTH
	call CopyData
	pop de
	ret

; C = species, DE = raw nickname. Preserve the name-lookup index for other consumers.
GetMonDisplayName_::
	ld a, [wOptions]
	bit BIT_HIDE_NICKNAMES, a
	ret z
	; Non-link enemies already have species names; keep special names such as GHOST.
	ld a, d
	cp HIGH(wEnemyMonNick)
	jr nz, GetSpeciesDisplayName
	ld a, e
	cp LOW(wEnemyMonNick)
	jr nz, GetSpeciesDisplayName
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret nz
; C = species. The original lookup index belongs to the caller, not this display.
GetSpeciesDisplayName:
	ld a, [wNamedObjectIndex]
	push af
	ld a, c
	ld [wNamedObjectIndex], a
	call GetMonName
	pop af
	ld [wNamedObjectIndex], a
	ret

; Text scripts also reference nickname buffers directly, bypassing the normal getters.
ResolveNicknameTextPointer::
	ld a, [wOptions]
	bit BIT_HIDE_NICKNAMES, a
	ret z
	ld a, d
	cp HIGH(wBattleMonNick)
	jr nz, .enemy
	ld a, e
	cp LOW(wBattleMonNick)
	jr nz, .enemy
	ld a, [wBattleMonSpecies2]
	jr .display
.enemy
	ld a, d
	cp HIGH(wEnemyMonNick)
	jr nz, .box
	ld a, e
	cp LOW(wEnemyMonNick)
	jr nz, .box
	ld a, [wEnemyMonSpecies2]
	jr .display
.box
	ld a, d
	cp HIGH(wBoxMonNicks)
	jr nz, .daycare
	ld a, e
	cp LOW(wBoxMonNicks)
	jr nz, .daycare
	ld a, [wBoxSpecies]
	jr .display
.daycare
	ld a, d
	cp HIGH(wDayCareMonName)
	ret nz
	ld a, e
	cp LOW(wDayCareMonName)
	ret nz
	ld a, [wDayCareMonSpecies]
.display
	ld c, a
	jp GetMonDisplayName_
