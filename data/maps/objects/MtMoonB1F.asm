	object_const_def
	const_export MTMOONB1F_ONIX

MtMoonB1F_Object:
	db $3 ; border block

	def_warp_events
	warp_event  5,  5, MT_MOON_1F, 3
	warp_event 17, 11, MT_MOON_B2F, 1
	warp_event 25,  9, MT_MOON_1F, 4
	warp_event 25, 15, MT_MOON_1F, 5
	warp_event 21, 17, MT_MOON_B2F, 2
	warp_event 17, 23, MT_MOON_B2F, 3
	warp_event 23,  3, MT_MOON_B2F, 4
	warp_event 27,  3, LAST_MAP, 3
	warp_event 11, 27, MT_MOON_1F, 6

	def_bg_events

	def_object_events
	object_event  2, 22, SPRITE_ONIX, STAY, DOWN, TEXT_MTMOONB1F_ONIX, ONIX, 15 | OW_POKEMON

	def_warps_to MT_MOON_B1F
