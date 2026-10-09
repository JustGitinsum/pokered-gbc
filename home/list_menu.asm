; INPUT:
; [wListMenuID] = list menu ID
; [wListPointer] = address of the list (2 bytes)
DisplayListMenuID::
	xor a
	ldh [hAutoBGTransferEnabled], a ; disable auto-transfer
	ld a, 1
	ldh [hJoy7], a ; joypad state update flag
	ld a, [wBattleType]
	and a ; is it the Old Man battle?
	jr nz, .specialBattleType
	callfar PrintBagInfoText ; marcelnote - new for bag pockets
	ld a, $01 ; hardcoded bank
	jr .bankswitch
.specialBattleType ; Old Man battle
	ld a, BANK(DisplayBattleMenu)
.bankswitch
	call BankswitchHome
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	ld [wListCount], a
	ld a, [wListPointer]
	ld l, a
	ld a, [wListPointer + 1]
	ld h, a ; hl = address of the list
	ld a, [hl] ; the first byte is the number of entries in the list
	ld [wListCount], a
	ld a, [wListMenuID]
	sub PRICEDITEMLISTMENU
	cp SPECIALLISTMENU - PRICEDITEMLISTMENU
	jr c, .itemListBox ; priced and regular item menus have consecutive IDs
	ld a, LIST_MENU_BOX
	jr .drawListMenuBox
.itemListBox
	; Bag and shop item lists need one more column for their labels.
	ld a, ITEM_LIST_MENU_BOX
.drawListMenuBox
	ld [wTextBoxID], a
	call DisplayTextBoxID ; draw the menu text box
	call UpdateSprites ; disable sprites behind the text box
	; UpdateSprites takes no coordinate arguments; only the PC list needs its second update.
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	jr nz, .skipMovingSprites
	call UpdateSprites
.skipMovingSprites
	ld a, 1 ; max menu item ID is 1 if the list has less than 2 entries
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, [wListCount]
	cp 2 ; does the list have less than 2 entries?
	jr c, .setMenuVariables
	ld a, 2 ; max menu item ID is 2 if the list has at least 2 entries
.setMenuVariables
	ld [wMaxMenuItem], a
	ld a, 4
	ld [wTopMenuItemY], a
	ld a, [wListMenuID]
	sub PRICEDITEMLISTMENU
	cp SPECIALLISTMENU - PRICEDITEMLISTMENU
	jr c, .leftShiftItemContents
	ld a, 5
	jr .storeTopMenuItemX
.leftShiftItemContents
	ld a, 4
.storeTopMenuItemX
	ld [wTopMenuItemX], a
	ld a, PAD_A | PAD_B | PAD_SELECT | PAD_RIGHT | PAD_LEFT ; marcelnote - added PAD_RIGHT for bag pockets
	ld [wMenuWatchedKeys], a
	ld c, 10
	call DelayFrames

DisplayListMenuIDLoop::
	xor a
	ldh [hAutoBGTransferEnabled], a ; disable transfer
	call PrintListMenuEntries
	ld a, 1
	ldh [hAutoBGTransferEnabled], a ; enable transfer
	call Delay3
	ld a, [wBattleType]
	and a ; is it the Old Man battle?
	jr z, .notOldManBattle
.oldManBattle
	ld a, "▶"
	ldcoord_a 5, 4 ; place menu cursor in front of first menu entry
	ld c, 80
	call DelayFrames
	xor a
	ld [wCurrentMenuItem], a
	hlcoord 5, 4
	ld a, l
	ld [wMenuCursorLocation], a
	ld a, h
	ld [wMenuCursorLocation + 1], a
	jr .buttonAPressed
.notOldManBattle
	call LoadGBPal
	call HandleMenuInput
	push af
	;call PrintBagInfoText ; marcelnote - new for bag pockets, should be placed around here if expect to display TM moves
	call PlaceMenuCursor
	pop af
	bit B_PAD_A, a
	jp z, .checkOtherKeys
.buttonAPressed
	ld a, [wCurrentMenuItem]
	call PlaceUnfilledArrowMenuCursor

; pointless because both values are overwritten before they are read
	; ld a, $01
	; ld [wMenuExitMethod], a
	; ld [wChosenMenuItem], a

	xor a
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, [wCurrentMenuItem]
	ld c, a
	ld a, [wListScrollOffset]
	add c
	ld c, a
	ld a, [wListCount]
	and a ; is the list empty?
	jp z, ExitListMenu ; if so, exit the menu
	dec a
	cp c ; did the player select Cancel?
	jp c, ExitListMenu ; if so, exit the menu
	ld a, c
	ld [wWhichPokemon], a
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr nz, .skipMultiplying
; if it's an item menu
	sla c ; item entries are 2 bytes long, so multiply by 2
.skipMultiplying
	ld a, [wListPointer]
	ld l, a
	ld a, [wListPointer + 1]
	ld h, a
	inc hl ; hl = beginning of list entries
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wCurListMenuItem], a
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	jr z, .pokemonList
; if it's an item menu
	ASSERT wCurListMenuItem == wCurItem
	push hl
	call GetItemPrice
	pop hl
	ld a, [wListMenuID]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;needed to make Mateo's move deleter/relearner work
	cp a, MOVESLISTMENU
	jr z, .skipStoringItemName
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	cp ITEMLISTMENU
	jr nz, .skipGettingQuantity
	inc hl
	ld a, [hl] ; a = item quantity
	ld [wMaxItemQuantity], a
.skipGettingQuantity
	ld a, [wNamedObjectIndex]
	ld [wNameListIndex], a
	ld a, ITEM_NAME ; marcelnote - added for robustness (needed for TM printing)
	ld [wNameListType], a
	ld a, BANK(ItemNames)
	ld [wPredefBank], a
	call GetName
	jr .storeChosenEntry
.pokemonList
	ASSERT wCurListMenuItem == wCurPartySpecies
	ld hl, wPartyCount
	ld a, [wListPointer]
	cp l ; is it a list of party pokemon or box pokemon?
	ld hl, wPartyMonNicks
	jr z, .getPokemonName
	ld hl, wBoxMonNicks ; box pokemon names
.getPokemonName
	ld a, [wWhichPokemon]
	call GetPartyMonName
.storeChosenEntry ; store the menu entry that the player chose and return
	ld de, wNameBuffer
	call CopyToStringBuffer
.skipStoringItemName	;skip here if skipping storing item name
	ld a, CHOSE_MENU_ITEM
	ld [wMenuExitMethod], a
	ld a, [wCurrentMenuItem]
	ld [wChosenMenuItem], a
	xor a
	ld [hJoy7], a ; joypad state update flag
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	jp BankswitchBack
.checkOtherKeys ; check B, SELECT, Up, and Down keys
	bit B_PAD_B, a
	jp nz, ExitListMenu ; if so, exit the menu
	bit B_PAD_SELECT, a
	jp nz, HandleItemListSwapping ; if so, allow the player to swap menu entries
	;;;;;;;;;; marcelnote - for bag pockets
	bit B_PAD_RIGHT, a
	jr nz, .switchBagPocketRight
	bit B_PAD_LEFT, a
	jr nz, .switchBagPocketLeft
	;;;;;;;;;;
	;ld b, a
	bit B_PAD_DOWN, a ; marcelnote - changed from bit B_PAD_DOWN, b (no point in using b)
	ld hl, wListScrollOffset
	jr z, .upPressed
.downPressed
	ld a, [hl]
	add 3
	ld b, a
	ld a, [wListCount]
	cp b ; will going down scroll past the Cancel button?
	jp c, DisplayListMenuIDLoop
	inc [hl] ; if not, go down
	jp DisplayListMenuIDLoop
.upPressed
	ld a, [hl]
	and a
	jp z, DisplayListMenuIDLoop
	dec [hl]
	jp DisplayListMenuIDLoop
.switchBagPocketRight
	; The banked cycling helper consumes this transient direction bit.
	ld hl, wBagPocketsFlags
	res BIT_PREVIOUS_POCKET, [hl]
	jr .switchBagPocket
.switchBagPocketLeft
	ld hl, wBagPocketsFlags
	set BIT_PREVIOUS_POCKET, [hl]
.switchBagPocket ; marcelnote - new for bag pockets
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jp nz, DisplayListMenuIDLoop
	ld hl, wBagPocketsFlags
	bit BIT_PC_WITHDRAWING, [hl] ; if withdrawing from PC then cannot switch pocket
	jp nz, DisplayListMenuIDLoop
	callfar CycleBagPocket
	call ExitListMenu ; this is to prevent an issue with BankswitchHome in DisplayListMenuID
	jp DisplayListMenuID

DisplayChooseQuantityMenu::
	hlcoord 15, 9 ; coordinates of TOSS item text box
	lb bc, 1, 3 ; height, width of TOSS item text box
	; Check for Shop menu
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .drawTextBox
    ; text box dimensions/coordinates for quantity and price
	hlcoord 7, 7
	lb bc, 3, 11 ; height, width
.drawTextBox
	call TextBoxBorder
	hlcoord 16, 10 ; coordinates TOSS item quantity text
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .printInitialQuantity
	callfar PrintHowManyOfThisItemAreOwned ; How many of this item are owned
	hlcoord 8, 10 ; coordinates SELL item quantity text
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
	ret
.buttonBPressed ; the player chose to cancel the transaction
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	ld a, $ff
	ret


InitialQuantityText::
	db "×01@"

SpacesBetweenQuantityAndPriceText::
	db "      @"

ExitListMenu::
	ld a, [wCurrentMenuItem]
	ld [wChosenMenuItem], a
	ld a, CANCELLED_MENU
	ld [wMenuExitMethod], a
	ld [wMenuWatchMovingOutOfBounds], a
	xor a
	ldh [hJoy7], a
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call BankswitchBack
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	scf
	ret

PrintListMenuEntries::
	ld a, [wListMenuID]
	sub PRICEDITEMLISTMENU
	cp SPECIALLISTMENU - PRICEDITEMLISTMENU
	jr c, .clearItemListArea
	hlcoord 5, 3
	ld b, 9
	ld c, 14
	jr .clearListArea
.clearItemListArea
	hlcoord 4, 3
	ld b, 9
	ld c, 15
.clearListArea
	call ClearScreenArea
	ld a, [wListPointer]
	ld e, a
	ld a, [wListPointer + 1]
	ld d, a
	inc de ; de = beginning of list entries
	ld a, [wListScrollOffset]
	ld c, a
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	ld a, c
	jr nz, .skipMultiplying
; if it's an item menu
; item entries are 2 bytes long, so multiply by 2
	sla a
	sla c
.skipMultiplying
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
	ld a, [wListMenuID]
	sub PRICEDITEMLISTMENU
	cp SPECIALLISTMENU - PRICEDITEMLISTMENU
	jr c, .leftShiftItemNames
	hlcoord 6, 4 ; coordinates of first list entry name
	jr .setFirstListEntry
.leftShiftItemNames
	hlcoord 5, 4 ; item names and related text shift with the wider list box
.setFirstListEntry
	ld b, 4 ; print 4 names
.loop
	ld a, b
	ld [wWhichPokemon], a
	ld a, [de]
	ld [wNamedObjectIndex], a
	cp $ff
	jp z, .printCancelMenuItem
	push bc
	push de
	push hl
	push hl
	push de
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	jr z, .pokemonPCMenu
	cp MOVESLISTMENU
	jr z, .movesMenu
.itemMenu
	call GetItemName
	call PlaceString
	ld a, [wBagPocketsFlags]
	bit BIT_TM_HM_POCKET, a
	jr z, .nameWasPrinted
	; Print the corresponding move on the second row only in the TM/HM pocket.
	ld d, h
	ld e, l
	callfar PrintTMHMMoveName
	jr .nameWasPrinted
.pokemonPCMenu
	push hl
	ld hl, wPartyCount
	ld a, [wListPointer]
	cp l ; is it a list of party pokemon or box pokemon?
	ld hl, wPartyMonNicks
	jr z, .getPokemonName
	ld hl, wBoxMonNicks ; box pokemon names
.getPokemonName
	ld a, [wWhichPokemon]
	ld b, a
	ld a, 4
	sub b
	ld b, a
	ld a, [wListScrollOffset]
	add b
	call GetPartyMonName
	pop hl
	jr .placeNameString
.movesMenu
	call GetMoveName
.placeNameString
	call PlaceString
.nameWasPrinted
	pop de
	pop hl
	ld a, [wPrintItemPrices]
	and a ; should prices be printed?
	jr z, .skipPrintingItemPrice
.printItemPrice
	push hl
	ld a, [de]
	ld de, ItemPrices
	ld [wCurItem], a
	call GetItemPrice
	pop hl
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .itemPriceOnSecondLine
	; TM prices share their item-name row; all other prices stay on the next row.
	ld a, [wNamedObjectIndex]
	cp TM01
	jr c, .itemPriceOnSecondLine
	cp TM01 + NUM_TMS
	jr nc, .itemPriceOnSecondLine
	ld bc, 5 ; same line, 5 columns right
	jr .placeItemPrice
.itemPriceOnSecondLine
	ld bc, SCREEN_WIDTH + 5 ; 1 row down and 5 columns right
.placeItemPrice
	add hl, bc
	ld c, 3 | LEADING_ZEROES | MONEY_SIGN
	call PrintBCDNumber
.skipPrintingItemPrice
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	jr nz, .skipPrintingPokemonLevel
.printPokemonLevel
	ld a, [wNamedObjectIndex]
	push af
	push hl
	ld hl, wPartyCount
	ld a, [wListPointer]
	cp l ; is it a list of party pokemon or box pokemon?
	ld a, PLAYER_PARTY_DATA
	jr z, .next
	ld a, BOX_DATA
.next
	ld [wMonDataLocation], a
	ld hl, wWhichPokemon
	ld a, [hl]
	ld b, a
	ld a, $04
	sub b
	ld b, a
	ld a, [wListScrollOffset]
	add b
	ld [hl], a
	call LoadMonData
	ld a, [wMonDataLocation]
	and a ; is it a list of party pokemon or box pokemon?
	jr z, .skipCopyingLevel
.copyLevel
	ld a, [wLoadedMonBoxLevel]
	ld [wLoadedMonLevel], a
.skipCopyingLevel
	pop hl
	ld bc, $1c
	add hl, bc
	call PrintLevel
	pop af
	ld [wNamedObjectIndex], a
.skipPrintingPokemonLevel
	pop hl
	pop de
	inc de
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr nz, .nextListEntry
.printItemQuantity
	ld a, [wNamedObjectIndex]
	ld [wCurItem], a
	call IsKeyItem ; check if item is unsellable
	ld a, [wIsKeyItem]
	and a ; is the item unsellable?
	jr nz, .skipPrintingItemQuantity ; if so, don't print the quantity
	push hl
	ld a, [wBagPocketsFlags]
	bit BIT_TM_HM_POCKET, a
	jr nz, .printTMQuantity
	ld bc, SCREEN_WIDTH + 8 ; 1 row down and 8 columns right
	jr .printQuantity
.printTMQuantity
	; The TM/HM move name uses the next row, so keep its stack count beside the item.
	ld bc, 8 ; same row, 8 columns right
.printQuantity
	add hl, bc
	ld a, "×"
	ld [hli], a
	ld a, [wNamedObjectIndex]
	push af
	ld a, [de]
	ld [wMaxItemQuantity], a
	push de
	ld de, wTempByteValue
	ld [de], a
	lb bc, 1, 2
	call PrintNumber
	pop de
	pop af
	ld [wNamedObjectIndex], a
	pop hl
.skipPrintingItemQuantity
	inc de
	pop bc
	inc c
	push bc
	inc c
	ld a, [wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	and a ; is an item being swapped?
	jr z, .nextListEntry
	sla a
	cp c ; is it this item?
	jr nz, .nextListEntry
	dec hl
	ld a, "▷"
	ld [hli], a
.nextListEntry
	ld bc, 2 * SCREEN_WIDTH ; 2 rows
	add hl, bc
	pop bc
	inc c
	dec b
	jp nz, .loop
	ld bc, -8
	add hl, bc
	; Keep the item-list scroll arrow at its original bottom-right tile.
	ld a, [wListMenuID]
	sub PRICEDITEMLISTMENU
	cp SPECIALLISTMENU - PRICEDITEMLISTMENU
	jr nc, .placeScrollArrow
	inc hl
.placeScrollArrow
	ld a, "▼"
	ld [hl], a
	ret
.printCancelMenuItem
	ld de, ListMenuCancelText
	jp PlaceString

ListMenuCancelText::
	db "CANCEL@"
	