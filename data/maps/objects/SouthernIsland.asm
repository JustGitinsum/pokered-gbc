	object_const_def
	const_export SOUTHERNISLAND_LATIOS

SouthernIsland_Object:
	db $02 ; border block

	def_warp_events

	def_bg_events

	def_object_events
	object_event  6,  4, SPRITE_LATIOS, STAY, ANIMATED_DOWN, TEXT_SOUTHERNISLAND_LATIOS, LATIOS, 40 | OW_POKEMON

	def_warps_to SOUTHERN_ISLAND
