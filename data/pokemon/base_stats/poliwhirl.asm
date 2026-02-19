	db DEX_POLIWHIRL ; pokedex id

	db  65,  65,  65,  90,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 120 ; catch rate
	db 131 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/poliwhirl.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/poliwhirl.pic", 0, 1 ; sprite dimensions
ENDC
	dw PoliwhirlPicFront, PoliwhirlPicBack

	db BUBBLE, HYPNOSIS, TRAILBLAZE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, RAGE,         EARTHQUAKE,   \
	     EARTH_POWER,      PSYCHIC_M,    MIMIC,        ICE_PUNCH,  ACCELEROCK,         \
	     METRONOME,    FIRE_PUNCH,   ICE_FANG,         EXTRASENSORY,      SUBSTITUTE,   \
	     SURF,         STRENGTH
	; end

	db BANK(PoliwhirlPicFront)
