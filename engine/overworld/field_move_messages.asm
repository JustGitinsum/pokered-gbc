PrintStrengthText:
	ld hl, wStatusFlags1
	set BIT_STRENGTH_ACTIVE, [hl]
	ld hl, UsedStrengthText
	jp PrintText

UsedStrengthText:
	text_far _UsedStrengthText
	text_asm
	ld a, [wCurPartySpecies]
	call PlayCry
	call Delay3
	jp TextScriptEnd

; CanMoveBouldersText:
; 	text_far _CanMoveBouldersText
; 	text_end

IsSurfingAllowed:
; Returns whether surfing is allowed in BIT_SURF_ALLOWED of wStatusFlags1.
; Surfing isn't allowed on the Cycling Road or in the lowest level of the
; Seafoam Islands before the current has been slowed with boulders.
	ld hl, wStatusFlags1
	set BIT_SURF_ALLOWED, [hl]
	call IsSurfBlocked
	ret nc
	push hl
	ld hl, wStatusFlags1
	res BIT_SURF_ALLOWED, [hl]
	pop hl
	jp PrintText

IsSurfBlocked::
; Returns carry and the rejection text in hl when Surf is forbidden.
	ld hl, CyclingIsFunText
	ld a, [wStatusFlags6]
	bit BIT_ALWAYS_ON_BIKE, a
	jr nz, .blocked
	ld a, [wCurMap]
	xor SEAFOAM_ISLANDS_B4F ; clear carry on other maps
	ret nz
	ASSERT EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE / 8 == EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE / 8
	CheckBothEventsSet EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE
	ret z ; equal event masks also clear carry
	ld hl, SeafoamIslandsB4FStairsCoords
	call ArePlayerCoordsInArray
	ret nc
	ld hl, CurrentTooFastText
.blocked
	scf
	ret

SeafoamIslandsB4FStairsCoords:
	dbmapcoord  7, 11
	db -1 ; end

CurrentTooFastText:
	text_far _CurrentTooFastText
	text_end

CyclingIsFunText:
	text_far _CyclingIsFunText
	text_end
