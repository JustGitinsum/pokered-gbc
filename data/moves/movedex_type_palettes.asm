; input: d = type ID, e = first tile ID for the icon
LoadTypeIcon8TileAt:
    ld hl, TypeGraphicMapping8Tile
    ld a, 8
    jr LoadTypeIconTiles

; d = move type. The palette must already be queued and tile transfer disabled.
; Stage graphics instead of overwriting the icon that is still visible.
QueueBattleMoveTypeIcon:
    ld hl, TypeGraphicMapping8Tile
    ld b, 0
    ld c, d
    add hl, bc
    add hl, bc
    ld a, [hli]
    ld h, [hl]
    ld l, a
    ldh a, [rWBK]
    ld b, a
    ld a, 2
    ldh [rWBK], a
    push bc
    ld de, W2_BattleTypeIconTiles
    ld bc, 8 tiles
    ld a, BANK(NormalTypeIcon8Tile)
    call FarCopyData2
    ld a, 3
    ld [W2_BattleTypePalettePending], a
    pop af
    ldh [rWBK], a
    ret

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
