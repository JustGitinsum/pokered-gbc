SeafoamIslandsB2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, wMiscFlags
	bit BIT_PUSHED_BOULDER, [hl]
	res BIT_PUSHED_BOULDER, [hl]
	jr z, .noBoulderWasPushed
	ld hl, Seafoam3HolesCoords
	call CheckBoulderCoords
	ret nc
	EventFlagAddress hl, EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE
	ld a, [wCoordIndex]
	cp $1
	jr nz, .boulder2FellDownHole
	SetEventReuseHL EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_B2F_BOULDER_1
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_B3F_BOULDER_3
	ld [wObjectToShow], a
	jr .hideAndShowBoulderObjects
.boulder2FellDownHole
	SetEventAfterBranchReuseHL EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_B2F_BOULDER_2
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_B3F_BOULDER_4
	ld [wObjectToShow], a
.hideAndShowBoulderObjects
	ld a, [wObjectToHide]
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, [wObjectToShow]
	ld [wMissableObjectIndex], a
	predef_jump ShowObject
.noBoulderWasPushed
	ld a, SEAFOAM_ISLANDS_B3F
	ld [wDungeonWarpDestinationMap], a
	ld hl, Seafoam3HolesCoords
	jp IsPlayerOnDungeonWarp

Seafoam3HolesCoords:
	dbmapcoord 19,  6
	dbmapcoord 22,  6
	db -1 ; end

SeafoamIslandsB2F_TextPointers:
	def_text_pointers
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB2F_BOULDER1
	dw_const BoulderText, TEXT_SEAFOAMISLANDSB2F_BOULDER2
	dw_const SeaFoamIslandsB2F_FossilText, TEXT_SEAFOAMISLANDSB2F_FOSSIL

SeaFoamIslandsB2F_FossilText:
	text_asm
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr nz, .got_dome_fossil
	lb bc, DOME_FOSSIL, 1
	call GiveItem
	jp nc, FossilNoRoomText
	call SeaFoamIslandsB2FReceivedFossilText
	ld a, HS_SEAFOAM_ISLANDS_B2F_FOSSIL
	ld [wMissableObjectIndex], a
	predef HideObject
	jr .Done

.got_dome_fossil
	lb bc, HELIX_FOSSIL, 1
	call GiveItem
	jp nc, FossilNoRoomText
	call SeaFoamIslandsB2FReceivedFossilText
	ld a, HS_SEAFOAM_ISLANDS_B2F_FOSSIL
	ld [wMissableObjectIndex], a
	predef HideObject
.Done
	jp TextScriptEnd

SeaFoamIslandsB2FReceivedFossilText:
	ld hl, .Text
	jp PrintText

.Text:
	text_far _MtMoonB2FReceivedFossilText
	sound_get_key_item
	text_waitbutton
	text_end

FossilNoRoomText:
	ld hl, .Text
		call PrintText
		jp TextScriptEnd

	.Text:
		text_far _OopsYouDontHaveEnoughRoomText
		text_waitbutton
		text_end