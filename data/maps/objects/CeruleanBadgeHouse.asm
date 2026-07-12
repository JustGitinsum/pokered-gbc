	object_const_def
	const_export CERULEANBADGEHOUSE_MIDDLE_AGED_MAN
	const_export CERULEANBADGEHOUSE_CUBONE

CeruleanBadgeHouse_Object:
	db $c ; border block

	def_warp_events
	warp_event  2,  0, LAST_MAP, 10
	warp_event  2,  7, LAST_MAP, 9
	warp_event  3,  7, LAST_MAP, 9

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_MIDDLE_AGED_MAN, STAY, RIGHT, TEXT_CERULEANBADGEHOUSE_MIDDLE_AGED_MAN
	object_event  4,  1, SPRITE_CUBONE, STAY, DOWN, TEXT_CERULEANBADGEHOUSE_CUBONE

	def_warps_to CERULEAN_BADGE_HOUSE
