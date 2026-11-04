; Return HL = species table, B = bank; HOME performs the actual bank switch.
GetMonNameTable::
	ld hl, MonsterNames
	ld b, BANK(MonsterNames)
	ld a, [wNameCaseOptions]
	bit BIT_MON_NAMES_UPPERCASE, a
	ret nz
	ld hl, MonsterNamesLowercase
	ld b, BANK(MonsterNamesLowercase)
	ret

; DE = chosen variable-length name table; wPredefBank = its bank.
GetNameTablePointer::
	ld a, [wNameListType]
	cp ITEM_NAME
	jr z, .item
	cp TRAINER_NAME
	jr z, .trainer
	dec a
	add a
	ld e, a
	ld d, 0
	ld hl, NamePointers
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret
.item
	ld a, [wNameCaseOptions]
	bit BIT_ITEM_NAMES_UPPERCASE, a
	ld de, ItemNames
	ld a, BANK(ItemNames)
	jr nz, .selected
	ld de, ItemNamesLowercase
	ld a, BANK(ItemNamesLowercase)
	jr .selected
.trainer
	ld a, [wNameCaseOptions]
	bit BIT_TRAINER_NAMES_UPPERCASE, a
	ld de, TrainerNames
	ld a, BANK(TrainerNames)
	jr nz, .selected
	ld de, TrainerNamesLowercase
	ld a, BANK(TrainerNamesLowercase)
.selected
	ld [wPredefBank], a
	ret

; Z if the stored nickname is either standard spelling of the pre-evolution species.
; Never treat a hidden display substitute as permission to overwrite a real nickname.
IsDefaultMonNickname::
	ld a, [wMonHIndex]
	ld [wNamedObjectIndex], a
	ld hl, wPartyMonNicks
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	callfar GetDefaultSpeciesName
	; A match returns wNameBuffer; a custom nickname retains its party address.
	ld a, d
	cp HIGH(wNameBuffer)
	ret nz
	ld a, e
	cp LOW(wNameBuffer)
	ret
