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
	callfar DrawBagMenuBackground
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
	ld a, [wListPointer]
	ld l, a
	ld a, [wListPointer + 1]
	ld h, a ; hl = address of the list
	ld a, [hl] ; the first byte is the number of entries in the list
	ld [wListCount], a
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	jr z, .skipMovingSprites
.notPCList
	cp PCWITHDRAWLISTMENU
	jr nz, .notWithdrawBox
	ld a, WITHDRAW_LIST_MENU_BOX
	jr .drawListMenuBox
.notWithdrawBox
	cp PRICEDITEMLISTMENU
	jr z, .skipMovingSprites ; the Buy list has no surrounding box
	cp ITEMLISTMENU
	jr z, .itemListBox
	ld a, LIST_MENU_BOX
	jr .drawListMenuBox
.itemListBox
	ld a, [wBagPocketsFlags]
	bit BIT_PRINT_INFO_BOX, a
	jr nz, .skipMovingSprites
	; Bag item lists need one more column for their labels.
	ld a, ITEM_LIST_MENU_BOX
.drawListMenuBox
	ld [wTextBoxID], a
	call DisplayTextBoxID ; draw the menu text box
	call UpdateSprites ; disable sprites behind the text box
	; UpdateSprites takes no coordinate arguments; only the PC list needs its second update.
	ld a, [wListMenuID]
	cp PCWITHDRAWLISTMENU
	jr nz, .skipMovingSprites
	call UpdateSprites
.skipMovingSprites
	ld a, 1 ; max menu item ID is 1 if the list has less than 2 entries
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	jr nz, .notPCMaxItem
	ld a, [wListCount]
	and a
	jr z, .setMenuVariables ; empty list
	cp PC_LIST_VISIBLE_ROWS
	jr c, .pcVisibleCount
	ld a, PC_LIST_VISIBLE_ROWS
.pcVisibleCount
	ld b, a ; b = number of visible entries
	ld a, [wListCount]
	sub b
	ld c, a ; c = highest valid scroll offset
	ld a, [wListScrollOffset]
	cp c
	jr c, .pcOffsetValid
	jr z, .pcOffsetValid
	ld a, c
	ld [wListScrollOffset], a
.pcOffsetValid
	dec b ; b = max menu item ID
	ld a, [wCurrentMenuItem]
	cp b
	jr c, .pcCursorValid
	jr z, .pcCursorValid
	ld a, b
	ld [wCurrentMenuItem], a
.pcCursorValid
	ld a, b
	jr .setMenuVariables
.notPCMaxItem
	ld b, 2
	ld a, [wListMenuID]
	cp PCWITHDRAWLISTMENU
	jr nz, .gotMaxItemLimit
	ld b, 3 ; the withdraw list has one more selectable row
.gotMaxItemLimit
	ld a, [wListCount]
	cp b ; does the list have fewer entries than the limit?
	jr c, .setMenuVariables
	ld a, b
.setMenuVariables
	ld [wMaxMenuItem], a
	ld a, 4
	ld [wTopMenuItemY], a
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	jr nz, .notPCCursor
	ld a, 1 ; the PC list cursor sits on the level row, below each name
	ld [wTopMenuItemY], a
	xor a ; cursor stays in column 0
	jr .storeTopMenuItemX
.notPCCursor
	cp PCWITHDRAWLISTMENU
	jr nz, .notWithdrawCursor
	ld a, 1
	ld [wTopMenuItemY], a
	ld a, 8
	jr .storeTopMenuItemX
.notWithdrawCursor
	sub PRICEDITEMLISTMENU
	jr z, .rightShiftBuyCursor
	cp SPECIALLISTMENU - PRICEDITEMLISTMENU
	jr c, .leftShiftItemContents
.rightShiftBuyCursor
	ld a, 5
	jr .storeTopMenuItemX
.leftShiftItemContents
	ld a, 4
.storeTopMenuItemX
	ld [wTopMenuItemX], a
	ld a, PAD_A | PAD_B | PAD_SELECT | PAD_RIGHT | PAD_LEFT | PAD_START ; marcelnote - added PAD_RIGHT for bag pockets
	ld [wMenuWatchedKeys], a
	farcall DelayBeforeListMenu

DisplayListMenuIDLoop::
	xor a
	ldh [hAutoBGTransferEnabled], a ; disable transfer
	callfar DrawListMenuWithItemPreview
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
	CALL_INDIRECT HandleItemListMenuInput
	ld a, e
	bit B_PAD_A, a
	jp z, .checkOtherKeys
.buttonAPressed::
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
	cp PCWITHDRAWLISTMENU
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
	ld a, [wCurItem] ; the print loop leaves wNamedObjectIndex at the CANCEL terminator
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
	ldh [hJoy7], a ; joypad state update flag
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	jp BankswitchBack
.checkOtherKeys ; check B, SELECT, Up, and Down keys
	bit B_PAD_B, a
	jp nz, ExitListMenu ; if so, exit the menu
	bit B_PAD_START, a
	jr nz, .switchPCList ; deposit screen only: shows the stats of the selected #MON
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
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	ld a, [hl]
	jr nz, .notPCScroll
	add PC_LIST_VISIBLE_ROWS
	ld b, a
	ld a, [wListCount]
	cp b ; is the last mon already visible?
	jr c, .switchPCList ; deposit screen: moves to CHANGE BOX / SEE YA
	jr z, .switchPCList
	inc [hl]
	jp DisplayListMenuIDLoop
.notPCScroll
	ld b, a
	ld a, [wListMenuID]
	cp PCWITHDRAWLISTMENU
	ld a, b
	jr nz, .notWithdrawScroll
	inc a ; the withdraw list shows one more row
.notWithdrawScroll
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
	jr z, .cycleBagPocket
.switchPCList
	callfar PCSideSwitch
.switchDone
	jp nc, DisplayListMenuIDLoop
	jp ExitListMenu
.cycleBagPocket
	ld hl, wBagPocketsFlags
	bit BIT_PC_WITHDRAWING, [hl] ; if withdrawing from PC then cannot switch pocket
	jp nz, DisplayListMenuIDLoop
	callfar CycleBagPocket
	call ExitListMenu ; this is to prevent an issue with BankswitchHome in DisplayListMenuID
	jp DisplayListMenuID

DisplayChooseQuantityMenu::
	callfar _DisplayChooseQuantityMenu
	ld a, e ; Bankswitch clobbers a, so the result comes back in e
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
	and a ; PCPOKEMONLISTMENU?
	jr nz, .notPCClear
	hlcoord 0, 0
	lb bc, 12, SCREEN_WIDTH
	jr .clearListArea
.notPCClear
	cp PCWITHDRAWLISTMENU
	jr nz, .notWithdrawClear
	hlcoord 8, 1
	ld b, 11
	ld c, 11
	jr .clearListArea
.notWithdrawClear
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
	ld b, 4 ; print 4 names
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	jr nz, .notPCNames
	hlcoord 3, 0 ; icons use columns 1-2
	ld b, PC_LIST_VISIBLE_ROWS
	jr .loop
.notPCNames
	cp PCWITHDRAWLISTMENU
	jr nz, .notWithdrawNames
	hlcoord 9, 1
	ld b, 5
	jr .loop
.notWithdrawNames
	; Item/move names begin one column after their list cursor.
	ld a, [wTopMenuItemX]
	inc a
	push bc
	ld c, a
	ld b, 0
	hlcoord 0, 4
	add hl, bc
	pop bc
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
	cp PCWITHDRAWLISTMENU
	jr z, .pokemonPCMenu
	cp MOVESLISTMENU
	jr z, .movesMenu
.itemMenu
	call GetItemName
	call PlaceString
	ld d, h
	ld e, l
	callfar PrintItemListExtras
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
	call GetPCListEntryIndex
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
	jr z, .printPokemonLevel
	cp PCWITHDRAWLISTMENU
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
	call GetPCListEntryIndex
	ld [wWhichPokemon], a
	call LoadMonData
	ld a, [wMonDataLocation]
	and a ; is it a list of party pokemon or box pokemon?
	jr z, .skipCopyingLevel
.copyLevel
	ld a, [wLoadedMonBoxLevel]
	ld [wLoadedMonLevel], a
.skipCopyingLevel
	pop hl
	ld bc, $19 ; level is on the row below the name
	ld a, [wListMenuID]
	and a
	jr nz, .gotLevelOffset
	ld c, $15 ; the PC list shows the level 5 columns further left
.gotLevelOffset
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
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	jr nz, .notPCScrollArrow
	ld bc, 3
	add hl, bc ; arrow goes at the bottom-right of the list
	; only show the arrow if more mons are below the visible ones
	ld a, [wListScrollOffset]
	add PC_LIST_VISIBLE_ROWS
	ld b, a
	ld a, [wListCount]
	cp b
	ret c
	ret z
	jr .placeScrollArrow
.notPCScrollArrow
	ld a, [wListMenuID]
	cp PCWITHDRAWLISTMENU
	jr nz, .notWithdrawArrow
	ld bc, 17 ; names start at column 9, so the arrow lands at the bottom-right of the box
	add hl, bc
	jr .placeScrollArrow
.notWithdrawArrow
	; Keep the item-list scroll arrow at its original bottom-right tile.
	sub PRICEDITEMLISTMENU
	cp SPECIALLISTMENU - PRICEDITEMLISTMENU
	jr nc, .placeScrollArrow
	inc hl
.placeScrollArrow
	ld a, "▼"
	ld [hl], a
	ret
.printCancelMenuItem
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	ret z ; the PC list has no CANCEL entry
	ld de, ListMenuCancelText
	jp PlaceString

; returns a = index of the mon in the list for the print loop row counter in [wWhichPokemon]
GetPCListEntryIndex:
	ld a, [wWhichPokemon]
	ld b, a
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	ld a, PC_LIST_VISIBLE_ROWS
	jr z, .gotRows
	ld a, 5 ; the withdraw list shows 5 entries
.gotRows
	sub b
	ld b, a
	ld a, [wListScrollOffset]
	add b
	ret

ListMenuCancelText::
	db "CANCEL@"
	