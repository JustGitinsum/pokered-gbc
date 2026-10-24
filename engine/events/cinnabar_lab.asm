; Both labs share pending revival data. A full party and box must not
; allow another fossil selection to overwrite the undelivered Pokemon.
; d = revival level, e = scientist object ID
FossilScientistInteraction::
	push de
	CheckEvent EVENT_GAVE_FOSSIL_TO_LAB
	jr nz, .deliver
	ld a, [wCurMap]
	ld hl, wFossilScientistIntroMap
	cp [hl]
	jr z, .skipIntro
	ld [hl], a
	ld hl, .GreetingText
	call PrintText
.skipIntro
	call GetFossilsInBag
	ld a, [wFilteredBagItemsCount]
	and a
	jr z, .noFossils
	call GiveFossilToCinnabarLab
	CheckEvent EVENT_GAVE_FOSSIL_TO_LAB
	jr z, .done
	pop de
	push de
	ld a, e
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call UpdateSprites
	call WaitForSoundToFinish
	call StopAllMusic
	ld a, MUSIC_PKMN_HEALED
	ld c, BANK(Music_PkmnHealed)
	call PlayMusic
.waitForHealingJingle
	call DelayFrame
	ld a, [wChannelSoundIDs]
	cp MUSIC_PKMN_HEALED
	jr z, .waitForHealingJingle
	call PlayDefaultMusic
	pop de
	push de
	ld a, e
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call UpdateSprites
.deliver
	call LoadFossilItemAndMonName
	ld hl, .FossilIsBackToLifeText
	call PrintText
	SetEvent EVENT_LAB_HANDING_OVER_FOSSIL_MON
	pop de
	push de
	ld c, d
	ld a, [wFossilMon]
	ld b, a
	call GivePokemon
	jr nc, .done
	ResetEvents EVENT_GAVE_FOSSIL_TO_LAB, EVENT_LAB_STILL_REVIVING_FOSSIL, EVENT_LAB_HANDING_OVER_FOSSIL_MON
.done
	pop de
	ret
.noFossils
	ld hl, .NoFossilsText
	call PrintText
	jr .done

.GreetingText:
	text_far _CinnabarLabFossilRoomScientist1Text
	text_end
.NoFossilsText:
	text_far _CinnabarLabFossilRoomScientist1NoFossilsText
	text_end
.FossilIsBackToLifeText:
	text_far _CinnabarLabFossilRoomScientist1FossilIsBackToLifeText
	text_end

ResetFossilScientistIntroOnMapChange::
	ld a, [wCurMap]
	ld hl, wFossilScientistIntroMap
	cp [hl]
	ret z
	ld [hl], -1
	ret

; Add supported fossils here; update NUM_FOSSIL_TYPES when adding entries.
FossilMonTable:
	table_width 2
	db DOME_FOSSIL,  KABUTO
	db HELIX_FOSSIL, OMANYTE
	db OLD_AMBER,    AERODACTYL
	db JAW_FOSSIL,   TYRUNT
	db SAIL_FOSSIL,  AMAURA
	assert_table_length NUM_FOSSIL_TYPES
	db 0

GetFossilsInBag:
	xor a
	ld [wFilteredBagItemsCount], a
	ld de, wFilteredBagItems
	ld hl, FossilMonTable
.loop
	ld a, [hli]
	and a
	jr z, .done
	inc hl
	push hl
	push de
	push af
	ld b, a
	predef GetQuantityOfItemInBag
	pop af
	pop de
	pop hl
	ld c, a
	ld a, b
	and a
	jr z, .loop
	ld a, c
	ld [de], a
	inc de
	push hl
	ld hl, wFilteredBagItemsCount
	inc [hl]
	pop hl
	jr .loop
.done
	ld a, $ff
	ld [de], a
	ret

GiveFossilToCinnabarLab::
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	xor a
	ld [wCurrentMenuItem], a
	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	ld a, [wFilteredBagItemsCount]
	dec a
	ld [wMaxMenuItem], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
	ld a, [wFilteredBagItemsCount]
	dec a
	ld bc, 2
	ld hl, 3
	call AddNTimes
	dec l
	ld b, l
	ld c, $d
	hlcoord 0, 0
	call TextBoxBorder
	call UpdateSprites
	call PrintFossilsInBag
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call HandleMenuInput
	bit B_PAD_B, a
	jr nz, .cancelledGivingFossil
	ld hl, wFilteredBagItems
	ld a, [wCurrentMenuItem]
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	ld c, a
	ld hl, FossilMonTable
.findFossil
	ld a, [hli]
	and a
	jr z, .cancelledGivingFossil
	ld b, [hl]
	inc hl
	cp c
	jr nz, .findFossil
.fossilSelected
	push af
	push bc
	call LoadSelectedFossilNames
	ld hl, .ScientistSeesFossilText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	pop bc
	pop de ; d = selected item; pending data is untouched until confirmation
	jr nz, .cancelledGivingFossil
	ld a, d
	ld [wFossilItem], a
	ld a, b
	ld [wFossilMon], a
	call LoadFossilItemAndMonName
	ld hl, .ScientistTakesFossilText
	call PrintText
	ld a, [wFossilItem]
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	SetEvent EVENT_GAVE_FOSSIL_TO_LAB
	ret
.cancelledGivingFossil
	ld hl, .ComeAgainText
	call PrintText
	ret

.ScientistSeesFossilText:
	text_far _CinnabarLabFossilRoomScientist1SeesFossilText
	text_end

.ScientistTakesFossilText:
	text_far _CinnabarLabFossilRoomScientist1TakesFossilText
	text_end

.ComeAgainText:
	text_far _CinnabarLabFossilRoomScientist1ComeAgainText
	text_end

PrintFossilsInBag:
; Prints each fossil in the player's bag on a separate line in the menu.
	ld hl, wFilteredBagItems
	xor a
	ldh [hItemCounter], a
.loop
	ld a, [hli]
	cp $ff
	ret z
	push hl
	ld [wNamedObjectIndex], a
	call GetItemName
	hlcoord 2, 2
	ldh a, [hItemCounter]
	ld bc, SCREEN_WIDTH * 2
	call AddNTimes
	ld de, wNameBuffer
	call PlaceString
	ld hl, hItemCounter
	inc [hl]
	pop hl
	jr .loop

; loads the names of the fossil item and the resulting mon
LoadFossilItemAndMonName::
	ld a, [wFossilItem]
	push af
	ld a, [wFossilMon]
	jr LoadFossilNames

; a = fossil item, b = revived species; leaves pending revival data unchanged
LoadSelectedFossilNames:
	push af
	ld a, b
LoadFossilNames:
	ld [wNamedObjectIndex], a
	call GetMonName
	call CopyToStringBuffer
	pop af
	ld [wNamedObjectIndex], a
	call GetItemName
	ret
