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

	db SCRATCH, TAIL_WHIP, DISABLE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   PAY_DAY,      EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         DIG,          MIMIC,        ICE_PUNCH,  ACCELEROCK,         \
	     SWIFT,        FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE,   SURF,         \
	     STRENGTH
	; end

	db BANK(GolduckPicFront)
