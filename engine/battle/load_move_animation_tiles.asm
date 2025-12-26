_LoadMoveAnimationTiles::
    ld a, [wWhichBattleAnimTileset]
	add a
	add a
	ld e, a
	ld d, 0

	; HAX: Load corresponding palettes as well
	call _LoadAnimationTilesetPalettes

	ld hl, MoveAnimationTilesPointers
	add hl, de
	ld a, [hli]
	ld [wTempTilesetNumTiles], a ; number of tiles
	ld c, a
	ld a, [hli]
	ld e, a
	ld d, [hl] ; de = address of tileset
	ld hl, vSprites tile $31
	ld b, BANK(MoveAnimationTiles0) ; ROM bank
	jp CopyVideoData ; load tileset

	; Padding to prevent data shifting
	nop

MACRO anim_tileset
	db \1
	dw \2
	db -1 ; padding
ENDM

MoveAnimationTilesPointers:
	; number of tiles, gfx pointer
	anim_tileset 79, MoveAnimationTiles0
	anim_tileset 79, MoveAnimationTiles1
	anim_tileset 64, MoveAnimationTiles2
    anim_tileset 79, MoveAnimationTiles3

MoveAnimationTiles0:
MoveAnimationTiles2:
	INCBIN "gfx/battle/move_anim_0.2bpp"

MoveAnimationTiles1:
	INCBIN "gfx/battle/move_anim_1.2bpp"
    
MoveAnimationTiles3:
	INCBIN "gfx/battle/move_anim_2.2bpp" 
