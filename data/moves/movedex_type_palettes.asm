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
LoadTypeIconSm:
    ld e, $c9

; input: d = type ID, e = first tile ID for the icon
LoadTypeIconSmAt:
    ld a, e
    ld l, a
    ld h, 0
    bit 7, a
    jr z, .frontPicTiles
    sub $80
    ld l, a
    ld bc, vFont
    jr .getDestination
.frontPicTiles
    ld bc, vFrontPic
.getDestination
    REPT 4
        add hl, hl
    ENDR
    add hl, bc
    push hl
    ld hl, TypeGraphicMappingSm
    ld a, d
    ld b, 0
    ld c, a
    add hl, bc
    add hl, bc
    ld a, [hli]
    ld e, a
    ld a, [hl]
    ld d, a
    lb bc, BANK(NormalTypeIconSm), 8
    pop hl
    jp CopyVideoData

TypeGraphicMappingSm:
    table_width 2

    dw NormalTypeIconSm   ; $00 NORMAL
    dw FightingTypeIconSm ; $01 FIGHTING
    dw FlyingTypeIconSm   ; $02 FLYING
    dw PoisonTypeIconSm   ; $03 POISON
    dw GroundTypeIconSm   ; $04 GROUND
    dw RockTypeIconSm     ; $05 ROCK
    dw NormalTypeIconSm   ; $06 BIRD: fallback until a Bird icon is available
    dw BugTypeIconSm      ; $07 BUG
    dw GhostTypeIconSm    ; $08 GHOST
    dw SteelTypeIconSm    ; $09 STEEL

    REPT UNUSED_TYPES_END - UNUSED_TYPES
        dw NormalTypeIconSm ; unused type fallback
    ENDR

    dw FireTypeIconSm     ; $14 FIRE
    dw WaterTypeIconSm    ; $15 WATER
    dw GrassTypeIconSm    ; $16 GRASS
    dw ElectricTypeIconSm ; $17 ELECTRIC
    dw PsychicTypeIconSm  ; $18 PSYCHIC
    dw IceTypeIconSm      ; $19 ICE
    dw DragonTypeIconSm   ; $1A DRAGON
    dw DarkTypeIconSm     ; $1B DARK
    dw FairyTypeIconSm    ; $1C FAIRY

    assert_table_length NUM_TYPES
