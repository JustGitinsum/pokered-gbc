	db DEX_MAROWAK ; pokedex id

	db  60,  80, 110,  45,  50
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 75 ; catch rate
	db 124 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/marowak.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/marowak.pic", 0, 1 ; sprite dimensions
ENDC
	dw MarowakPicFront, MarowakPicBack

	db TACKLE, GROWL, LEER, FOCUS_ENERGY ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   MEGA_KICK,    TOXIC,        FIRE_FANG,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     EARTHQUAKE,   EARTH_POWER,      DIG,          MIMIC,        ICE_PUNCH,  \
	     ACCELEROCK,         FIRE_BLAST,   FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE,   \
	     STRENGTH
	; end

	db BANK(MarowakPicFront)
