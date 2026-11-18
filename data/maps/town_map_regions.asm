MACRO town_map_region
	; map, left, top, right, bottom (inclusive)
	assert \2 >= 0 && \2 <= \4 && \4 < 16
	assert \3 >= 0 && \3 <= \5 && \5 < 16
	db \2, \4 + 1
	dn \5, \3
	db \1
ENDM

; Landmarks in TownMapOrder override these route stretches.
TownMapRouteRegions:
	town_map_region ROUTE_1,   2,  9,  2, 10
	town_map_region ROUTE_2,   2,  4,  2,  7
	town_map_region ROUTE_3,   3,  3,  5,  3
	town_map_region ROUTE_4,   5,  2,  9,  2
	town_map_region ROUTE_5,  10,  3, 10,  4
	town_map_region ROUTE_6,  10,  6, 10,  8
	town_map_region ROUTE_7,   8,  5,  9,  5
	town_map_region ROUTE_8,  11,  5, 13,  5
	town_map_region ROUTE_9,  11,  2, 14,  2
	town_map_region ROUTE_10, 14,  3, 14,  4
	town_map_region ROUTE_11, 11,  9, 13,  9
	town_map_region ROUTE_12, 14,  6, 14, 10
	town_map_region ROUTE_13, 11, 11, 14, 11
	town_map_region ROUTE_14, 10, 11, 10, 12
	town_map_region ROUTE_15,  9, 13, 11, 13
	town_map_region ROUTE_16,  4,  5,  6,  5
	town_map_region ROUTE_17,  4,  6,  4, 12
	town_map_region ROUTE_18,  4, 13,  7, 13
	town_map_region ROUTE_19,  8, 14,  8, 15
	town_map_region ROUTE_19,  6, 15,  7, 15
	town_map_region ROUTE_20,  3, 15,  4, 15
	town_map_region ROUTE_21,  2, 12,  2, 14
	town_map_region ROUTE_22,  0,  8,  1,  8
	town_map_region ROUTE_23,  0,  3,  0,  7
	town_map_region ROUTE_24, 10,  0, 10,  1
	town_map_region ROUTE_25, 11,  0, 12,  0
	db -1
