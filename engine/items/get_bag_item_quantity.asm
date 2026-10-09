GetQuantityOfItemInBag:
; In: b = item ID
; Out: b = how many of that item are in the bag
	call GetPredefRegisters
	ld a, [wCurItem]
	ld c, a ; store current content of [wCurItem] in c
	ld a, b
	ld [wCurItem], a
	; Use the item's owning pocket rather than whichever pocket is currently open.
	call GetBagItemList
	ld a, c
	ld [wCurItem], a ; restore [wCurItem], else issues with wild Silph Scope encounters
.loop
	inc hl
	ld a, [hli]
	cp $ff
	jr z, .notInBag
	cp b
	jr nz, .loop
	ld a, [hl]
	ld b, a
	ret
.notInBag
	ld b, 0
	ret

; marcelnote - copied from PureRGB, for Repel reuse prompt
; PureRGBnote: ADDED: function for determining what index an item is in the player's bag.
GetIndexOfItemInBag:
; In: b = item ID
; Out: b = index of item in bag (FF if not)
	call GetPredefRegisters
	ld c, -1
	ld a, [wCurItem]
	push af
	ld a, b
	ld [wCurItem], a
	; Resolve the same pocket used by the quantity lookup before scanning its entries.
	call GetBagItemList
	pop af
	ld [wCurItem], a
	dec hl
.loop
	inc c
	inc hl
	ld a, [hli]
	cp $ff
	jr z, .notInBag
	cp b
	jr nz, .loop
	ld b, c
	ret
.notInBag
	ld b, a
	ret
