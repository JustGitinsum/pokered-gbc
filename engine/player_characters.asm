; Player character data accessors (see data/player_characters.asm).
; Far routines take inputs in e because Bankswitch clobbers a, b and c;
; it preserves de and hl on return.

; a = PLAYER_* constant (invalid values act as PLAYER_RED)
; returns hl = PlayerCharacters entry
GetPlayerCharacterEntry:
	cp NUM_PLAYER_CHARACTERS
	jr c, .valid
	xor a ; PLAYER_RED
.valid
	; Multiply by 18 in constant time; this lookup also runs during overworld OAM updates.
	ASSERT PLAYER_CHAR_LENGTH == 18
	ld l, a
	ld h, 0
	ld b, h
	ld c, l
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	add hl, hl
	ld bc, PlayerCharacters
	add hl, bc
	ret

; a = PLAYER_* constant; returns a = PLAYER_MALE or PLAYER_FEMALE
; preserves bc and de; clobbers hl
GetPlayerCharacterGender:
	push bc
	call GetPlayerCharacterEntry
	ASSERT PLAYER_CHAR_GENDER == 0
	ld a, [hl]
	pop bc
	ret

; e = PLAYER_GFX_* constant
; returns de = graphics pointer, h = graphics bank
GetPlayerGfx::
	ld a, [wPlayerGender]
; a = PLAYER_* constant, e = PLAYER_GFX_* constant
GetPlayerGfxForCharacter:
	; The entry lookup preserves e, avoiding a stack save of the graphics type.
	call GetPlayerCharacterEntry
	ASSERT PLAYER_CHAR_GFX + 3 * (NUM_PLAYER_GFX - 1) < $100
	ld a, e
	add a
	add e
	add PLAYER_CHAR_GFX
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, a
	ret

; returns d = pic palette (PAL_*), e = overworld sprite palette (SPR_PAL_*),
; h = trainer card border palette (PAL_*)
GetPlayerPalettes::
	ld a, [wPlayerGender]
	call GetPlayerCharacterEntry
	ASSERT PLAYER_CHAR_SPRITE_PAL == PLAYER_CHAR_PIC_PAL + 1
	ASSERT PLAYER_CHAR_CARD_PAL == PLAYER_CHAR_SPRITE_PAL + 1
	ASSERT PLAYER_CHAR_PIC_PAL == 1
	inc hl
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld h, [hl]
	ret

; draws the intro's player name list box with this character's default names
DrawPlayerDefaultNames::
	hlcoord 0, 0
	lb bc, 10, 9
	call TextBoxBorder
	hlcoord 3, 0
	ld de, .nameText
	call PlaceString
	hlcoord 2, 2
	ld de, .newNameText
	call PlaceString
	call GetPlayerDefaultNames
	hlcoord 2, 4
	jp PlaceString

.nameText
	db "NAME@"
.newNameText
	db "NEW NAME@"

; e = default name number (1 = first name); copies it to wNameBuffer
GetPlayerDefaultName::
	push de
	call GetPlayerDefaultNames
	ld h, d
	ld l, e
	pop de
.skipNames
	dec e
	jr z, .copy
.skipName
	ld a, [hli]
	cp "<NEXT>"
	jr nz, .skipName
	jr .skipNames
.copy
	ld de, wNameBuffer
.copyLoop
	ld a, [hli]
	cp "<NEXT>"
	jr z, .terminate
	ld [de], a
	inc de
	cp "@"
	ret z
	jr .copyLoop
.terminate
	ld a, "@"
	ld [de], a
	ret

; returns de = this character's default names
GetPlayerDefaultNames:
	ld a, [wPlayerGender]
	call GetPlayerCharacterEntry
	ld bc, PLAYER_CHAR_NAMES
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret

; a = PLAYER_MALE or PLAYER_FEMALE
; returns a = the first character of that gender (PLAYER_RED if none)
GetFirstPlayerCharacter:
	ld c, a
	xor a
.loop
	ld b, a
	call GetPlayerCharacterGender
	cp c
	ld a, b
	ret z
	inc a
	cp NUM_PLAYER_CHARACTERS
	jr c, .loop
	xor a ; PLAYER_RED
	ret

; a = PLAYER_* constant, c = 1 (next) or -1 (previous)
; returns a = the next/previous character of the same gender, wrapping around
; (a is unchanged if there is no other character of that gender)
GetNextPlayerCharacter:
	ld b, a
	call GetPlayerCharacterGender
	ld e, a
	ld a, b
.loop
	add c
	cp NUM_PLAYER_CHARACTERS
	jr c, .inRange
	ld a, NUM_PLAYER_CHARACTERS - 1
	bit 7, c
	jr nz, .inRange
	xor a
.inRange
	cp b
	ret z
	ld d, a
	call GetPlayerCharacterGender
	cp e
	ld a, d
	jr nz, .loop
	ret
