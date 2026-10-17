; The Buy menu reserves the nine unused bold-letter tiles for a 24x24 icon.
DEF BUY_ITEM_ICON_TILE EQU $60
DEF ITEM_ICON_TILES EQU 9

DrawBuyItemIcon::
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
	jp z, ClearBuyItemIcon
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
	farcall SetPal_BuyItemIcon
.loadGraphics
	; A matched icon replaces all nine tiles; only missing items need clearing.
	pop de
	ld hl, vChars2 tile BUY_ITEM_ICON_TILE
	lb bc, BANK(ItemIconPointers), ITEM_ICON_TILES
	call CopyVideoData
	hlcoord 1, 4
	ld a, BUY_ITEM_ICON_TILE
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

ClearBuyItemIcon::
	hlcoord 1, 4
	lb bc, 3, 3
	jp ClearScreenArea
