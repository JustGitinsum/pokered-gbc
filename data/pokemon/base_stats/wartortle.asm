	db DEX_WARTORTLE ; pokedex id

	db  59,  63,  80,  58,  65
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 143 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/wartortle.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/wartortle.pic", 0, 1 ; sprite dimensions
ENDC
	dw WartortlePicFront, WartortlePicBack

	db TACKLE, TAIL_WHIP, BUBBLE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, RAGE,         DIG,          \
	     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         FIRE_PUNCH,   \
	     ICE_FANG,         SUBSTITUTE,   SURF,         STRENGTH
	; end

	db BANK(WartortlePicFront)
