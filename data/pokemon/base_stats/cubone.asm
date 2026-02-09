	db DEX_CUBONE ; pokedex id

	db  50,  50,  95,  35,  40
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 190 ; catch rate
	db 87 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/cubone.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/cubone.pic", 0, 1 ; sprite dimensions
ENDC
	dw CubonePicFront, CubonePicBack

	db TACKLE, GROWL, TAIL_WHIP, LEER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   MEGA_KICK,    TOXIC,        FIRE_FANG,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         EARTHQUAKE,   \
	     EARTH_POWER,      DIG,          MIMIC,        ICE_PUNCH,  ACCELEROCK,         \
	     FIRE_BLAST,   FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE,   STRENGTH
	; end

	db BANK(CubonePicFront)
