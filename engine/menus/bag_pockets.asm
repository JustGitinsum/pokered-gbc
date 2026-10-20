DEF BAG_SELECT_ICON_TILE EQU $6b
DEF BAG_EXP_ALL_ICON_TILE EQU $69
DEF BAG_POCKET_ICON_TILE EQU $40
DEF BAG_POCKET_ICON_TILES EQU 20

; Pocket IDs are encoded by bits 1-0: Items=0, Key Items=1, TM/HMs=2.
; Returns the count-byte address for the currently selected pocket in HL.
GetCurrentBagList::
	ld a, [wBagPocketsFlags]
	and (1 << BIT_KEY_ITEMS_POCKET) | (1 << BIT_TM_HM_POCKET)
	jr z, .mainItems
	dec a
	jr z, .keyItems
	ld hl, wNumBagTMHMs
	ret
.mainItems
	ld hl, wNumBagItems
	ret
.keyItems
	ld hl, wNumBagKeyItems
	ret

DrawBagMenuBackground::
	ld hl, wBagPocketsFlags
	bit BIT_PRINT_INFO_BOX, [hl]
	ret z
	; Pocket changes re-enter the list, so build the entire Bag off-screen.
	call HideSprites
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT, SCREEN_WIDTH
	call ClearScreenArea
	farcall DrawBagPocketIcon
	hlcoord 3, 0
	lb bc, 1, 15
	call TextBoxBorder
	hlcoord 4, 1
	ld de, BagItemsText
	ld a, [wBagPocketsFlags]
	bit BIT_KEY_ITEMS_POCKET, a
	jr nz, .keyItemsPocket
	bit BIT_TM_HM_POCKET, a
	jr nz, .tmHMsPocket
.mainPocket
	call PlaceString
	hlcoord 12, 1
	ld de, wNumBagItems
	lb bc, 1 | LEADING_ZEROES, 2
	call PrintNumber
	ld [hl], "/"
	inc hl
	ld de, BagItemCapacity
	jp PrintNumber
.keyItemsPocket
	; Borrow unused textbox tiles; the normal Bag exit restores them.
	ld de, BattleMenuBallGraphicsEnd - 2 tiles
	ld hl, vChars2 tile BAG_SELECT_ICON_TILE
	lb bc, BANK(BattleMenuBallGraphics), 2
	call CopyVideoData
	ld de, BagExpAllStateGraphics
	ld a, [wStatusFlags1]
	bit BIT_EXP_ALL_ACTIVE, a
	jr nz, .loadExpAllState
	ld de, BagExpAllStateGraphics + 2 tiles
.loadExpAllState
	ld hl, vChars2 tile BAG_EXP_ALL_ICON_TILE
	lb bc, BANK(BagExpAllStateGraphics), 2
	call CopyVideoData
	hlcoord 4, 1
	ld de, BagKeyItemsText
	jp PlaceString
.tmHMsPocket
	; Keep the pocket label, but omit the item/capacity counter for TM/HMs.
	ld de, BagTMHMsText
	jp PlaceString

BagItemCapacity:
	db BAG_ITEM_CAPACITY

; Returns the count-byte address for [wCurItem]'s storage pocket in HL.
; TMs and HMs share a pocket; HMs remain protected through IsKeyItem.
GetBagItemList::
	ld a, [wCurItem]
	cp HM01
	jr nc, .tmHMs
	call IsKeyItem
	ld a, [wIsKeyItem]
	and a
	ld hl, wNumBagItems
	ret z
	ld hl, wNumBagKeyItems
	ret
.tmHMs
	ld hl, wNumBagTMHMs
	ret

PrintItemListExtras::
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr z, PrintTMHMMoveName
	ld a, [wBagPocketsFlags]
	bit BIT_TM_HM_POCKET, a
	jr nz, PrintTMHMMoveName
	and (1 << BIT_PRINT_INFO_BOX) | (1 << BIT_KEY_ITEMS_POCKET)
	cp (1 << BIT_PRINT_INFO_BOX) | (1 << BIT_KEY_ITEMS_POCKET)
	ret nz
	ld a, [wNamedObjectIndex]
	cp EXP_ALL
	jr z, .itemMarker
	ld a, [wSelectButtonItem]
	and a
	ret z
	ld hl, wNamedObjectIndex
	cp [hl]
	ret nz
.itemMarker
	; Leave one space after the complete name, including its internal spaces.
	push de
	call GetItemName
	ld c, 1
.nameLength
	ld a, [de]
	cp "@"
	jr z, .placeMarker
	inc de
	inc c
	jr .nameLength
.placeMarker
	pop hl
	ld b, 0
	add hl, bc
	ld a, [wNamedObjectIndex]
	cp EXP_ALL
	ld a, BAG_SELECT_ICON_TILE
	jr nz, .placeIcon
	ld a, BAG_EXP_ALL_ICON_TILE
.placeIcon
	; Both badges are two consecutive tiles.
	ld [hli], a
	inc a
	ld [hl], a
	ret

; Input: [wNamedObjectIndex] = TM/HM item ID, de = item name position
PrintTMHMMoveName::
	ld a, [wNamedObjectIndex]
	cp TM01
	jr nc, .tm
	cp HM01
	ret c
	push af
	sub HM01
	add NUM_TMS + 1
	jr .getMove
.tm
	cp TM01 + NUM_TMS
	ret nc
	push af
	sub TM01 - 1
.getMove
	; TMToMove indexes HMs after the TM list, matching the item-ID ranges.
	ld [wTempTMHM], a
	callfar TMToMove
	ld a, [wTempTMHM]
	ld [wNamedObjectIndex], a
	push de
	call GetMoveName
	pop hl
	ld bc, SCREEN_WIDTH + 1
	add hl, bc
	call PlaceString
	pop af
	ld [wNamedObjectIndex], a
	ret

CycleBagPocket::
	; Pocket IDs: Items=0, Key Items=1, TM/HMs=2.
	; Forward order is Items -> TM/HMs -> Key Items, i.e. (id - 1) mod 3;
	; the one-shot previous flag cycles the reverse order, (id + 1) mod 3.
	ld a, [wBagPocketsFlags]
	ld b, a
	and (1 << BIT_KEY_ITEMS_POCKET) | (1 << BIT_TM_HM_POCKET)
	bit BIT_PREVIOUS_POCKET, b
	jr nz, .previousPocket
	sub 1
	jr nc, .store
	ld a, 2
	jr .store
.previousPocket
	inc a
	cp 3
	jr c, .store
	xor a
.store
	ld c, a
	ld a, b
	; Replace the pocket ID and clear the one-shot direction flag.
	and %11101100
	or c
	ld [wBagPocketsFlags], a
	call GetCurrentBagList
	ld a, h
	ld [wListPointer + 1], a
	ld a, l
	ld [wListPointer], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	ret

BagItemsText:
	db "◀ ITEMS       ▶@"

BagKeyItemsText:
	db "◀  KEY ITEMS  ▶@"

BagTMHMsText:
	db "◀   TMs/HMs   ▶@"

PUSHS
SECTION "Bag Pocket Icon", ROMX

DrawBagPocketIcon::
	ldh a, [rWBK]
	ld b, a
	ld a, 2
	ldh [rWBK], a
	push bc
	ld a, [W2_BagPocketTilesActive]
	and a
	jr nz, .saved
	call DisableLCD
	ld hl, vChars2 tile BAG_POCKET_ICON_TILE
	ld de, W2_BagPocketSavedTiles
	ld bc, BAG_POCKET_ICON_TILES tiles
	call CopyData
	ld a, 1
	ld [W2_BagPocketTilesActive], a
.saved
	pop bc
	ld a, b
	ldh [rWBK], a
	ld de, BagPocketItemsGraphics
	ld a, [wBagPocketsFlags]
	bit BIT_KEY_ITEMS_POCKET, a
	jr nz, .key
	bit BIT_TM_HM_POCKET, a
	jr z, .load
	ld de, BagPocketTMHMsGraphics
	jr .load
.key
	ld de, BagPocketKeyItemsGraphics
.load
	ldh a, [rBGP]
	and a
	jr z, .hidden
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jr z, .hidden
	ld hl, vChars2 tile BAG_POCKET_ICON_TILE
	lb bc, BANK(BagPocketItemsGraphics), BAG_POCKET_ICON_TILES
	jp CopyVideoData
.hidden
	; Initial entry and party returns are white: copy at once, not over VBlanks.
	; DisableLCD hangs if the LCD is already off, so only call it while on.
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	call nz, DisableLCD
	ld h, d
	ld l, e
	ld de, vChars2 tile BAG_POCKET_ICON_TILE
	ld bc, BAG_POCKET_ICON_TILES tiles
	ld a, BANK(BagPocketItemsGraphics)
	call FarCopyData2
	jp EnableLCD

PlaceBagPocketIcon::
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	ret nz
	ld a, [wBagPocketsFlags]
	bit BIT_PRINT_INFO_BOX, a
	ret z
	hlcoord 0, 8
	ld a, BAG_POCKET_ICON_TILE
	ld b, 4
.row
	ld c, 5
.tile
	ld [hli], a
	inc a
	dec c
	jr nz, .tile
	ld de, SCREEN_WIDTH - 5
	add hl, de
	dec b
	jr nz, .row
	ret

RestoreBagPocketTiles::
	ldh a, [rWBK]
	ld b, a
	ld a, 2
	ldh [rWBK], a
	push bc
	ld a, [W2_BagPocketTilesActive]
	and a
	jr z, .done
	call DisableLCD
	ld hl, W2_BagPocketSavedTiles
	ld de, vChars2 tile BAG_POCKET_ICON_TILE
	ld bc, BAG_POCKET_ICON_TILES tiles
	call CopyData
	xor a
	ld [W2_BagPocketTilesActive], a
	call EnableLCD
.done
	pop bc
	ld a, b
	ldh [rWBK], a
	ret

POPS

PrepareBattleBagMenu::
	ld a, [wBattleType]
	dec a
	jr z, .tutorial
	ld hl, wBagPocketsFlags
	set BIT_PRINT_INFO_BOX, [hl]
	; Bag icons and SELECT borrow tiles still used by the outgoing battle HUD.
	call GBPalWhiteOutWithDelay3
	ld hl, vBackPic + 47 tiles
	ld de, W2_BattleBagSavedBackPicTiles
	jp CopyBattleBagBackPicTiles
.tutorial
	; The scripted Old Man list keeps its original battle-screen layout.
	ld a, BAG_INFO_BOX
	ld [wTextBoxID], a
	jp DisplayTextBoxID

CloseBattleBagMenu::
	ld hl, wBagPocketsFlags
	res BIT_PRINT_INFO_BOX, [hl]
	ld a, [wBattleType]
	dec a
	ret z
	; Battle HP/HUD tiles overlap the icon's borrowed character range.
	; Restore them while blank, before displaying the battle screen again.
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	farcall RestoreBagItemPreview
	farcall LoadHudAndHpBarAndStatusTilePatterns
	ld hl, W2_BattleBagSavedBackPicTiles
	ld de, vBackPic + 47 tiles
	call CopyBattleBagBackPicTiles
	call LoadScreenTilesFromBuffer1
	call Delay3
	jp LoadGBPal

CopyBattleBagBackPicTiles:
	; The icon overlaps the last two picture tiles, even with Substitute/Minimize.
	call DisableLCD
	ldh a, [rWBK]
	ld b, a
	ld a, 2
	ldh [rWBK], a
	push bc
	ld bc, 2 tiles
	call CopyData
	pop bc
	ld a, b
	ldh [rWBK], a
	jp EnableLCD
