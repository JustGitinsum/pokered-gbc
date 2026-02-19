	db DEX_BLASTOISE ; pokedex id

	db  79,  83, 100,  78,  85
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 210 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/blastoise.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/blastoise.pic", 0, 1 ; sprite dimensions
ENDC
	dw BlastoisePicFront, BlastoisePicBack

	db TACKLE, TAIL_WHIP, BUBBLE, TRAILBLAZE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     EARTHQUAKE,   EARTH_POWER,      DIG,          MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE,   \
	     SURF,         STRENGTH
	; end

	db BANK(BlastoisePicFront)
