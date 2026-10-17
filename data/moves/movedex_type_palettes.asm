; PureRGBnote: ADDED: subroutines for choosing which color palette the type icons in the movedex should use, and which icon images to use for which type.

; input d = type ID
; output d = palette ID
GetTypePalette:
	ld hl, TypePaletteMapping
	ld a, d ; d = type ID
	ld b, 0
	ld c, a
	add hl, bc ; which palette to use for this type
	ld a, [hl]
	ld d, a
	ret

TypePaletteMapping:
	db PAL_GRAYMON;normal
	db PAL_BROWNMON;fighting
	db PAL_MEWMON;flying
	db PAL_PURPLEMON;poison
	db PAL_REDMON;ground
	db PAL_GRAYMON;rock
	db PAL_GRAYMON;typeless
	db PAL_GREENMON;bug
	db PAL_BLACK;ghost
	db PAL_BLACK; crystal (no moves use this type)
	db PAL_REDMON ; bonemerang (same as ground)
	db PAL_BLACK;unused
	db PAL_BLACK;unused
	db PAL_BLACK;unused
	db PAL_BLACK;unused
	db PAL_BLACK;unused
	db PAL_BLACK;unused
	db PAL_GRAYMON;tri
	db PAL_BLACK;unused
	db PAL_BLACK;unused
	db PAL_REDMON;fire
	db PAL_BLUEMON;water
	db PAL_GREENMON;grass
	db PAL_YELLOWMON;electric
	db PAL_PINKMON;psychic
	db PAL_CYANMON;ice
	db PAL_BLUEMON;dragon

; input d = type ID
LoadTypeIcon:
	ld hl, TypeGraphicMapping
	ld a, d ; d = type ID
	ld b, 0
	ld c, a
	add hl, bc 
	add hl, bc ; pointer to which function to use for this type
	; ld a, d
	; cp PSYCHIC_TYPE
	; call z, CheckGBCPsychic
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	lb bc, BANK(NormalTypeIcon), 4
	ld hl, vChars1 + $400
	jp CopyVideoData

TypeGraphicMapping:
	dw NormalTypeIcon
	dw FightingTypeIcon;fighting
	dw FlyingTypeIcon;flying
	dw PoisonTypeIcon;poison
	dw GroundTypeIcon;ground
	dw RockTypeIcon;rock
	dw TypelessIcon;typeless
	dw BugTypeIcon;bug
	dw GhostTypeIcon;ghost
	dw 0 ; crystal (no moves use this type)
	dw GroundTypeIcon ; bonemerang
	dw 0 ;unused
	dw 0 ;unused
	dw 0 ;unused
	dw 0 ;unused
	dw 0 ;unused
	dw 0 ;unused
	dw TriTypeIcon ;tri
	dw 0 ;unused (floating - no moves use this type)
	dw 0 ;unused (magma - no moves use this type)
	dw FireTypeIcon;fire
	dw WaterTypeIcon;water
	dw GrassTypeIcon;grass
	dw ElectricTypeIcon;electric
	dw PsychicTypeIcon;psychic
	dw IceTypeIcon;ice
	dw DragonTypeIcon;dragon

; CheckGBCPsychic:
; 	ld a, [wOptions2]
; 	and %11
; 	cp PALETTES_YELLOW
; 	ret nz
; 	ld hl, _PsychicTypeGBCIcon ; need a different icon when in GBC colors mode because it will look weird otherwise
; 	ret

_PsychicTypeGBCIcon:
	dw PsychicTypeGBCIcon

; input: d = type ID
LoadTypeIcon8Tile:
    ld e, $c9

; input: d = type ID, e = first tile ID for the icon
LoadTypeIcon8TileAt:
    ld hl, TypeGraphicMapping8Tile
    ld a, 8
    jr LoadTypeIconTiles

; input: d = type ID, e = first tile ID
LoadTypeIcon4TileAt::
    ld hl, TypeGraphicMapping4Tile
    ld a, 4

LoadTypeIconTiles:
    push af
    push hl
    ld a, e
    ; Rebase signed BG tile IDs onto the $8800-$97ff character range.
    xor $80
    ld l, a
    ld h, 0
    REPT 4
        add hl, hl
    ENDR
    ld bc, vFont
    add hl, bc
    pop bc
    push hl
    ld h, b
    ld l, c
    ld a, d
    ld b, 0
    ld c, a
    add hl, bc
    add hl, bc
    ld a, [hli]
    ld e, a
    ld a, [hl]
    ld d, a
    pop hl
    pop bc
    ld c, b
    ld b, BANK(NormalTypeIcon8Tile)
    jp CopyVideoData

TypeGraphicMapping8Tile:
    table_width 2

    dw NormalTypeIcon8Tile   ; $00 NORMAL
    dw FightingTypeIcon8Tile ; $01 FIGHTING
    dw FlyingTypeIcon8Tile   ; $02 FLYING
    dw PoisonTypeIcon8Tile   ; $03 POISON
    dw GroundTypeIcon8Tile   ; $04 GROUND
    dw RockTypeIcon8Tile     ; $05 ROCK
    dw NormalTypeIcon8Tile   ; $06 BIRD: fallback until a Bird icon is available
    dw BugTypeIcon8Tile      ; $07 BUG
    dw GhostTypeIcon8Tile    ; $08 GHOST
    dw SteelTypeIcon8Tile    ; $09 STEEL

    REPT UNUSED_TYPES_END - UNUSED_TYPES
        dw NormalTypeIcon8Tile ; unused type fallback
    ENDR

    dw FireTypeIcon8Tile     ; $14 FIRE
    dw WaterTypeIcon8Tile    ; $15 WATER
    dw GrassTypeIcon8Tile    ; $16 GRASS
    dw ElectricTypeIcon8Tile ; $17 ELECTRIC
    dw PsychicTypeIcon8Tile  ; $18 PSYCHIC
    dw IceTypeIcon8Tile      ; $19 ICE
    dw DragonTypeIcon8Tile   ; $1A DRAGON
    dw DarkTypeIcon8Tile     ; $1B DARK
    dw FairyTypeIcon8Tile    ; $1C FAIRY

    assert_table_length NUM_TYPES

TypeGraphicMapping4Tile:
    table_width 2
    dw TypeIcon4Tile + 0 * 4 tiles ; NORMAL
    dw TypeIcon4Tile + 1 * 4 tiles ; FIGHTING
    dw TypeIcon4Tile + 2 * 4 tiles ; FLYING
    dw TypeIcon4Tile + 3 * 4 tiles ; POISON
    dw TypeIcon4Tile + 4 * 4 tiles ; GROUND
    dw TypeIcon4Tile + 5 * 4 tiles ; ROCK
    dw TypeIcon4Tile + 18 * 4 tiles ; BIRD uses the unknown type badge
    dw TypeIcon4Tile + 6 * 4 tiles ; BUG
    dw TypeIcon4Tile + 7 * 4 tiles ; GHOST
    dw TypeIcon4Tile + 8 * 4 tiles ; STEEL
    REPT UNUSED_TYPES_END - UNUSED_TYPES
        dw TypeIcon4Tile + 19 * 4 tiles ; unknown type badge
    ENDR
    dw TypeIcon4Tile + 9 * 4 tiles ; FIRE
    dw TypeIcon4Tile + 10 * 4 tiles ; WATER
    dw TypeIcon4Tile + 11 * 4 tiles ; GRASS
    dw TypeIcon4Tile + 12 * 4 tiles ; ELECTRIC
    dw TypeIcon4Tile + 13 * 4 tiles ; PSYCHIC
    dw TypeIcon4Tile + 14 * 4 tiles ; ICE
    dw TypeIcon4Tile + 15 * 4 tiles ; DRAGON
    dw TypeIcon4Tile + 16 * 4 tiles ; DARK
    dw TypeIcon4Tile + 17 * 4 tiles ; FAIRY
    assert_table_length NUM_TYPES
