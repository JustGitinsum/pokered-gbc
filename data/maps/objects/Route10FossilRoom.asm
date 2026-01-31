	object_const_def
	const_export ROUTE10FOSSILROOM_SCIENTIST1
;	const_export CINNABARLABFOSSILROOM_SCIENTIST2

Route10FossilRoom_Object:
	db $17 ; border block

	def_warp_events
	warp_event  2,  7, ROUTE_10, 5
	warp_event  3,  7, ROUTE_10, 5

	def_bg_events

	def_object_events
	object_event  6,  6, SPRITE_SCIENTIST, STAY, UP, TEXT_ROUTE10FOSSILROOM_SCIENTIST1
	object_event  2,  4, SPRITE_SCIENTIST, STAY, DOWN, TEXT_ROUTE10FOSSILROOM_SCIENTIST2

	def_warps_to ROUTE_10_FOSSIL_ROOM
