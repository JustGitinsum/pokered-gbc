	db DEX_GOLDUCK ; pokedex id

	db  80,  82,  78,  85,  80
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 75 ; catch rate
	db 174 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/golduck.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/golduck.pic", 0, 1 ; sprite dimensions
ENDC
	dw GolduckPicFront, GolduckPicBack

	db SCRATCH, TAIL_WHIP, WATER_GUN, CONFUSION ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     SLUDGE_BOMB,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SIGNAL_BEAM,      EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, \
	     RAGE,         DIG,          MIMIC,        ICE_PUNCH,  ACCELEROCK,         \
	     STEEL_WING,        FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE,   SURF,         \
	     STRENGTH
	; end

	db BANK(GolduckPicFront)
