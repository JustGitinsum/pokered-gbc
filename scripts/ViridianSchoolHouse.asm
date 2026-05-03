ViridianSchoolHouse_Script:
	jp EnableAutoTextBoxDrawing

ViridianSchoolHouse_TextPointers:
	def_text_pointers
	dw_const ViridianSchoolHouseBrunetteGirlText, TEXT_VIRIDIANSCHOOLHOUSE_BRUNETTE_GIRL
	dw_const ViridianSchoolHouseSwiftTutor, TEXT_VIRIDIANSCHOOLHOUSE_SWIFT_TUTOR

ViridianSchoolHouseBrunetteGirlText:
	text_far _ViridianSchoolHouseBrunetteGirlText
	text_end

ViridianSchoolHouseSwiftTutor:
	text_asm
	ld a, 1
	ld [wWhichTrade], a
	farcall MoveTutorScript
	jp TextScriptEnd
	; text_far _ViridianSchoolHouseCooltrainerFText
	; text_end
