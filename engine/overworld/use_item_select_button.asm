; marcelnote - adapted from PureRGB and shinpokered
UseSelectButtonItem::
	ld a, [wSelectButtonItem] ; options are BICYCLE, TOWN_MAP, *_ROD, ITEMFINDER, POKE_FLUTE
	and a
	ret z ; if NO_ITEM associated, do nothing
	ld b, a
	call IsItemInBag
	ret z ; if associated item is not in bag, do nothing

	; Fast path: getting on/off the bike prints no text, so skip the text box
	; setup/teardown (screen copies, font and sprite reloads) that causes a pause.
	ld a, [wSelectButtonItem]
	cp BICYCLE
	jr nz, .normalPath
	ld a, [wIsInBattle]
	and a
	jr nz, .normalPath
	ld a, [wStatusFlags6]
	bit BIT_ALWAYS_ON_BIKE, a
	jr nz, .normalPath
	ld a, [wWalkBikeSurfState]
	cp 2 ; surfing?
	jr z, .normalPath
	and a
	jr nz, .fastToggle ; already biking, so getting off is always allowed
	call IsBikingAllowed
	jr nc, .normalPath ; let the normal path print the error text
.fastToggle
	ld a, BICYCLE
	ld [wCurItem], a
	call UseItem
	call LoadPlayerSpriteGraphics
	jp UpdateSprites

.normalPath
	predef GetTileAndCoordsInFrontOfPlayer ; update tile in front of player for rods

	; initialize a text box without drawing anything special
	ld a, 1
	ld [wAutoTextBoxDrawingControl], a
	callfar DisplayTextIDInit

	ld a, [wSelectButtonItem]
	ld [wCurItem], a	      ; load item to be used
	ld [wNamedObjectIndex], a ; load item so its name can be grabbed
	call GetItemName	      ; get the item name into de register
	call CopyToStringBuffer
	call UseItem

	; load $FF into hTextID to make DisplayTextID close the text box
	ld a, $FF
	ldh [hTextID], a
	jp DisplayTextID

CheckIfSelectItem:: ; sets z flag if item in [wCurItem] cannot be associated with Select button
	ld hl, SelectItemsList
	ld a, [wCurItem]
	jp IsInList ; returns carry if found

SelectItemsList:
	db BICYCLE
	db TOWN_MAP
	db OLD_ROD
	db GOOD_ROD
	db SUPER_ROD
	db ITEMFINDER
	db POKE_FLUTE
	db -1