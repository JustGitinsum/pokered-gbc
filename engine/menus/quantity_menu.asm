; Called through DisplayChooseQuantityMenu in home/list_menu.asm.
; Returns the result in e, because Bankswitch overwrites a.
_DisplayChooseQuantityMenu::
	hlcoord 15, 9 ; coordinates of TOSS item text box
	lb bc, 1, 3 ; height, width of TOSS item text box
	; Check for Shop menu
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .drawTextBox
	; Sell keeps its owned-count row; Buy already has the live Bag box.
	hlcoord 7, 7
	lb bc, 3, 11 ; height, width
	ldh a, [hHalveItemPrices]
	and a
	jr nz, .drawTextBox
	hlcoord 7, 9
	lb bc, 1, 11
.drawTextBox
	call TextBoxBorder
	hlcoord 16, 10 ; coordinates TOSS item quantity text
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .printInitialQuantity
	ldh a, [hHalveItemPrices]
	and a
	jr z, .shopQuantity
	call PrintHowManyOfThisItemAreOwned
.shopQuantity
	hlcoord 8, 10 ; shop quantity text
.printInitialQuantity
	ld de, InitialQuantityText
	call PlaceString
	xor a
	ld [wItemQuantity], a ; initialize current quantity to 0
	jp .incrementQuantity
.waitForKeyPressLoop
	call JoypadLowSensitivity
	ldh a, [hJoyPressed] ; newly pressed buttons
	bit B_PAD_A, a
	jp nz, .buttonAPressed
	bit B_PAD_B, a
	jp nz, .buttonBPressed
	bit B_PAD_UP, a
	jr nz, .incrementQuantity
	bit B_PAD_DOWN, a
	jr nz, .decrementQuantity
	; Added for Add or Subtract 10
	bit B_PAD_RIGHT, a
	jr nz, .incrementQuantityBy10
	bit B_PAD_LEFT, a
	jr nz, .decrementQuantityBy10
	;------------------------------
	jr .waitForKeyPressLoop
.incrementQuantity
	ld a, [wMaxItemQuantity]
	inc a
	ld b, a
	ld hl, wItemQuantity ; current quantity
	inc [hl]
	ld a, [hl]
	cp b
	jr nz, .handleNewQuantity
; wrap to 1 if the player goes above the max quantity
	ld a, 1
	ld [hl], a
	jr .handleNewQuantity

.incrementQuantityBy10 ; Added for Add or Subtract 10
	ld a, [wMaxItemQuantity]
	inc a
	ld b, a
	ld hl, wItemQuantity ; current quantity
	ld a, [hl]
	add 10
	ld [hl], a
	cp b
	jr c, .handleNewQuantity
    ; Set to Max if the player goes above the max quantity
	ld a, [wMaxItemQuantity]
	ld [hl], a
	jr .handleNewQuantity
.decrementQuantityBy10
	ld hl, wItemQuantity ; current quantity
	ld a, [hl]
	sub 11 ; sub 11 instead of 10 to also set carry when a is 10,
    ; this is to avoid an extra jr z that is slower than the inc a below
	jr nc, .adjustDecrementedQuantity
    ; Set to 1 if the player goes below 1
	xor a ; fallthrough will set it to 1
.adjustDecrementedQuantity
	inc a ; [hl] - 11 + 1 = [hl] - 10
	ld [hl], a
	jr .handleNewQuantity

.decrementQuantity
	ld hl, wItemQuantity ; current quantity
	dec [hl]
	jr nz, .handleNewQuantity
; wrap to the max quantity if the player goes below 1
	ld a, [wMaxItemQuantity]
	ld [hl], a
.handleNewQuantity
	hlcoord 17, 10
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .printQuantity
.printPrice
	ld c, $03
	ld a, [wItemQuantity]
	ld b, a
	ld hl, hMoney ; total price
; initialize total price to 0
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
.addLoop ; loop to multiply the individual price by the quantity to get the total price
	ld de, hMoney + 2
	ld hl, hItemPrice + 2
	push bc
	predef AddBCDPredef ; add the individual price to the current sum
	pop bc
	dec b
	jr nz, .addLoop
	ldh a, [hHalveItemPrices]
	and a ; should the price be halved (for selling items)?
	jr z, .skipHalvingPrice
	xor a
	ldh [hDivideBCDDivisor], a
	ldh [hDivideBCDDivisor + 1], a
	ld a, $02
	ldh [hDivideBCDDivisor + 2], a
	predef DivideBCDPredef3 ; halves the price
; store the halved price
	ldh a, [hDivideBCDQuotient]
	ldh [hMoney], a
	ldh a, [hDivideBCDQuotient + 1]
	ldh [hMoney + 1], a
	ldh a, [hDivideBCDQuotient + 2]
	ldh [hMoney + 2], a
.skipHalvingPrice
	hlcoord 12, 10
	ld de, SpacesBetweenQuantityAndPriceText
	call PlaceString
	ld de, hMoney ; total price
	ld c, 3 | LEADING_ZEROES | MONEY_SIGN
	call PrintBCDNumber
	hlcoord 9, 10
.printQuantity
	ld de, wItemQuantity ; current quantity
	lb bc, LEADING_ZEROES | 1, 2 ; 1 byte, 2 digits
	call PrintNumber
	jp .waitForKeyPressLoop
.buttonAPressed ; the player chose to make the transaction
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	ld e, a
	ret
.buttonBPressed ; the player chose to cancel the transaction
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	ld e, $ff
	ret

PrintHowManyOfThisItemAreOwned::
	hlcoord 12, 8
	ld de, OwnedText
	call PlaceString
	ld a, [wCurItem]
	call GetOwnedItemQuantity
	ld [wTempByteValue], a
	hlcoord 17, 8
	ld de, wTempByteValue
	lb bc, 1, 2 ; 1 byte, 2 digits
	jp PrintNumber

OwnedText:
	db "Bag ×@"

; a = item ID; returns the owned count in a, capped to the two-digit display.
GetOwnedItemQuantity:
	ld b, a
	predef GetQuantityOfItemInBag
	ld a, b
	cp 100
	ret c
	ld a, 99
	ret

UpdateBuyMenuCursorInfo:
	hlcoord 0, 0
	lb bc, 1, 8
	call TextBoxBorder
	hlcoord 1, 1
	ld de, OwnedText
	call PlaceString
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	add b
	ld b, a
	ld a, [wListCount]
	cp b
	jr z, .cancel
	jr c, .cancel
	ld a, [wListPointer]
	ld l, a
	ld a, [wListPointer + 1]
	ld h, a
	inc hl
	ld c, b
	ld b, 0
	add hl, bc
	ld a, [hl]
	push af
	call GetOwnedItemQuantity
	ld [wTempByteValue], a
	hlcoord 6, 1
	ld de, wTempByteValue
	lb bc, LEADING_ZEROES | 1, 2
	call PrintNumber
	pop af
	ld [wCurItem], a
	farcall DisplayBuyItemDescription
	farcall DrawBuyItemIcon
	ret
.cancel
	farcall ClearBuyItemIcon
	farcall RestoreItemMenuPalettes
	hlcoord 1, 1
	lb bc, 1, 8
	call ClearScreenArea
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBoxBorder
	hlcoord 1, 14
	ld de, BuyMenuExitDescription
	jp PlaceString

BuyMenuExitDescription:
	db "Exit?@"

BlinkListMenuScrollArrow::
	hlcoord 18, 11
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .blink
	ldh a, [hJoy7]
	and a
	jr z, .blink
	inc hl
.blink
	jp HandleDownArrowBlinkTiming

DrawListMenuWithBuyInfo::
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr z, .buy
	farcall RestoreItemMenuPalettes
	jr .printLists
.buy
	; Buy reaches column 19, one tile beyond the shared item-list clear.
	hlcoord 19, 3
	lb bc, 9, 1
	call ClearScreenArea
	xor a
	ldh [hDownArrowBlinkCount1], a
	ld a, 6
	ldh [hDownArrowBlinkCount2], a
.printLists
	callfar PCDrawBothLists
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	ret nz
	; Complete the Buy screen before its tilemap is transferred to the display.
	jp PlaceMenuCursorAndBuyInfo

PlaceMenuCursorAndBuyInfo::
	call PlaceMenuCursor
	ldh a, [hJoy7]
	and a ; quantity/confirmation menus must not change the highlighted item
	ret z
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	ret nz
	; Graphics loaders wait for VBlank; keep partial redraws off the display.
	push hl
	ld a, [wCurItem]
	push af
	ld a, [wStatusFlags5]
	push af
	set BIT_NO_TEXT_DELAY, a
	ld [wStatusFlags5], a
	ldh a, [hAutoBGTransferEnabled]
	push af
	xor a
	ldh [hAutoBGTransferEnabled], a
	call UpdateBuyMenuCursorInfo
	pop af
	ldh [hAutoBGTransferEnabled], a
	pop af
	ld [wStatusFlags5], a
	pop af
	ld [wCurItem], a
	pop hl
	ret