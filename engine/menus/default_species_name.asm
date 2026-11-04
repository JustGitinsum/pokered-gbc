; DE = saved nickname, wNamedObjectIndex = species.
; Standard species names follow the selected case; custom nicknames stay unchanged.
; Keep this helper with both fixed-width species tables so comparison needs no buffer.
GetDefaultSpeciesName::
	ASSERT BANK(GetDefaultSpeciesName) == BANK(MonsterNames)
	ASSERT BANK(GetDefaultSpeciesName) == BANK(MonsterNamesLowercase)
	ld hl, MonsterNames
	call .compare
	jp z, GetMonName
	ld hl, MonsterNamesLowercase
	call .compare
	jp z, GetMonName
	ret
.compare
	push de
	ld a, [wNamedObjectIndex]
	dec a
	ld bc, NAME_LENGTH - 1
	call AddNTimes
	ld b, NAME_LENGTH - 1
.loop
	ld a, [de]
	cp [hl]
	jr nz, .done
	inc de
	inc hl
	cp "@"
	jr z, .done
	dec b
	jr nz, .loop
.done
	pop de
	ret
