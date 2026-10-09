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

PrintBagInfoText::
	ld hl, wBagPocketsFlags
	bit BIT_PRINT_INFO_BOX, [hl]
	ret z
	hlcoord 4, 1
	ld de, BagItemsText
	ld a, [wBagPocketsFlags]
	bit BIT_KEY_ITEMS_POCKET, a
	jr nz, .keyItemsPocket
	bit BIT_TM_HM_POCKET, a
	jr nz, .tmHMsPocket
.mainPocket
	call PlaceString
	ld a, [wNumBagItems]
	ld b, a
	ld c, BAG_ITEM_CAPACITY
	jr .loadText
.keyItemsPocket
	ld de, BagKeyItemsText
	jp PlaceString
.tmHMsPocket
	; Keep the pocket label, but omit the item/capacity counter for TM/HMs.
	ld de, BagTMHMsText
	jp PlaceString
.loadText
	hlcoord 12, 1
	ld de, w2CharStringBuffer
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	dec de
	lb bc, 1 | LEADING_ZEROES, 2
	call PrintNumber
	ld [hl], "/"
	inc hl
	inc de
	inc de
	call PrintNumber
	ret

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

; Input: [wNamedObjectIndex] = TM/HM item ID, de = text position below item name
PrintTMHMMoveName::
	ld a, [wNamedObjectIndex]
	cp TM01
	jr nc, .tm
	cp HM01
	jr c, .notMachine
	push af
	sub HM01
	add NUM_TMS + 1
	jr .getMove
.tm
	cp TM01 + NUM_TMS
	jr nc, .notMachine
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
.notMachine
	ret

CycleBagPocket::
	; Forward order is Items -> TM/HMs -> Key Items; left cycles the reverse order.
	ld a, [wBagPocketsFlags]
	bit BIT_PREVIOUS_POCKET, a
	jr nz, .previousPocket
	and (1 << BIT_KEY_ITEMS_POCKET) | (1 << BIT_TM_HM_POCKET)
	and a
	jr z, .nextFromItems
	cp 2
	jr z, .nextFromTMHMs
	xor a
	jr CycleBagPocketStore
.nextFromItems
	ld a, 2
	jr CycleBagPocketStore
.nextFromTMHMs
	ld a, 1
	jr CycleBagPocketStore
.previousPocket
	ld a, [wBagPocketsFlags]
	and (1 << BIT_KEY_ITEMS_POCKET) | (1 << BIT_TM_HM_POCKET)
	and a
	jr z, .previousFromItems
	cp 1
	jr z, .previousFromKeyItems
	xor a
	jr CycleBagPocketStore
.previousFromItems
	ld a, 1
	jr CycleBagPocketStore
.previousFromKeyItems
	ld a, 2
CycleBagPocketStore:
	ld b, a
	ld a, [wBagPocketsFlags]
	; Replace the pocket ID and clear the one-shot direction flag.
	and %11101100
	or b
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
