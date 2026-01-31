Route10FossilRoom_Script:
	jp EnableAutoTextBoxDrawing

Route10FossilRoom_TextPointers:
	def_text_pointers
	dw_const Route10FossilRoomScientist1Text, TEXT_ROUTE10FOSSILROOM_SCIENTIST1
	dw_const Route10FossilRoomScientist2Text, TEXT_ROUTE10FOSSILROOM_SCIENTIST2

Lab4Script_GetFossilsInBag2:
; construct a list of all fossils in the player's bag
	xor a
	ld [wFilteredBagItemsCount], a
	ld de, wFilteredBagItems
	ld hl, FossilsList2
.loop
	ld a, [hli]
	and a
	jr z, .done
	push hl
	push de
	ld [wTempByteValue], a
	ld b, a
	predef GetQuantityOfItemInBag
	pop de
	pop hl
	ld a, b
	and a
	jr z, .loop
	; A fossil is in the bag
	ld a, [wTempByteValue]
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

FossilsList2:
	db DOME_FOSSIL
	db HELIX_FOSSIL
	db OLD_AMBER
	; db 
	; db SAIL_FOSSIL
	db 0 ; end

Route10FossilRoomScientist1Text:
	text_asm
	; CheckEvent EVENT_GAVE_FOSSIL_TO_LAB
	; jr nz, .done_reviving
	ld hl, .Text
	call PrintText
	call Lab4Script_GetFossilsInBag2
	ld a, [wFilteredBagItemsCount]
	and a
	jr z, .no_fossils
	farcall GiveFossilToCinnabarLab
	jr .theend
.no_fossils
	ld hl, .NoFossilsText
	call PrintText
.done
	jp TextScriptEnd
.theend
	CheckEvent EVENT_GAVE_FOSSIL_TO_LAB
	jr nz, .done_reviving
	jr .done
; .check_done_reviving
; 	CheckEventAfterBranchReuseA EVENT_LAB_STILL_REVIVING_FOSSIL, EVENT_GAVE_FOSSIL_TO_LAB
; 	jr z, .done_reviving
; 	ld hl, .GoForAWalkText
; 	call PrintText
; 	jr .done
.done_reviving
	ld a, ROUTE10FOSSILROOM_SCIENTIST1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call UpdateSprites
	ld a, SFX_SWITCH
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld a, SFX_HEAL_AILMENT
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld a, SFX_GET_ITEM_1
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld a, ROUTE10FOSSILROOM_SCIENTIST1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	call UpdateSprites
	call LoadFossilItemAndMonNameBank1D2
	ld hl, .FossilIsBackToLifeText
	call PrintText
	SetEvent EVENT_LAB_HANDING_OVER_FOSSIL_MON
	ld a, [wFossilMon]
	ld b, a
	ld c, 25
	call GivePokemon
	jr nc, .done
	ResetEvents EVENT_GAVE_FOSSIL_TO_LAB, EVENT_LAB_STILL_REVIVING_FOSSIL, EVENT_LAB_HANDING_OVER_FOSSIL_MON
	jr .done

.Text:
	text_far _CinnabarLabFossilRoomScientist1Text
	text_end

.NoFossilsText:
	text_far _CinnabarLabFossilRoomScientist1NoFossilsText
	text_end

; .GoForAWalkText:
; 	text_far _CinnabarLabFossilRoomScientist1GoForAWalkText
; 	text_end

.FossilIsBackToLifeText:
	text_far _CinnabarLabFossilRoomScientist1FossilIsBackToLifeText
	text_end

Route10FossilRoomScientist2Text:
	text_far _Route10FossilRoomScientist2Text
	text_end

LoadFossilItemAndMonNameBank1D2:
	farjp LoadFossilItemAndMonName
