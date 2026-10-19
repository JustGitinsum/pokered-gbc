; Buy and Bag borrow nine textbox tiles for a 24x24 icon.
DEF ITEM_MENU_ICON_TILE EQU $60
DEF ITEM_ICON_TILES EQU 9

DrawItemMenuIcon::
	ld a, [wCurItem]
	ld hl, ItemIconPointers
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	or d
	jp z, ClearItemMenuIcon
	push de
	ld a, [wCurItem]
	cp HM01
	jr c, .itemPalette
	cp TM01 + NUM_TMS
	jr nc, .itemPalette
	farcall SetPal_TMHMDisc
	jr .loadGraphics
.itemPalette
	ld hl, ItemIconPalettes
	ld c, a
	ld b, 0
	add hl, bc
	ld d, [hl]
	farcall SetPal_ItemMenuIcon
.loadGraphics
	; A matched icon replaces all nine tiles; only missing items need clearing.
	pop de
	ld hl, vChars2 tile ITEM_MENU_ICON_TILE
	lb bc, BANK(ItemIconPointers), ITEM_ICON_TILES
	call CopyVideoData
	hlcoord 1, 4
	ld a, ITEM_MENU_ICON_TILE
	ld b, 3
.row
	ld c, 3
.tile
	ld [hli], a
	inc a
	dec c
	jr nz, .tile
	ld de, SCREEN_WIDTH - 3
	add hl, de
	dec b
	jr nz, .row
	ret

ClearItemMenuIcon::
	hlcoord 1, 4
	lb bc, 3, 3
	jp ClearScreenArea
