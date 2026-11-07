	object_const_def
	const_export ROUTE9LAPRASCAVE_LAPRAS

Route9LaprasCave_Object:
	db $7d ; border block

	def_warp_events
	warp_event  6, 11, LAST_MAP, 1
	warp_event  7, 11, LAST_MAP, 1

	def_bg_events

	def_object_events
	object_event  6,  5, SPRITE_LAPRAS, STAY, DOWN, TEXT_ROUTE9LAPRASCAVE_LAPRAS, LAPRAS, 30 | OW_POKEMON

	def_warps_to ROUTE_9_LAPRAS_CAVE
