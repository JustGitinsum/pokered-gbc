	db DEX_POLIWRATH ; pokedex id

	db  90,  85,  95,  70,  70
	;   hp  atk  def  spd  spc

	db WATER, FIGHTING ; type
	db 45 ; catch rate
	db 185 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/poliwrath.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/poliwrath.pic", 0, 1 ; sprite dimensions
ENDC
	dw PoliwrathPicFront, PoliwrathPicBack

	db HYPNOSIS, TRAILBLAZE, DOUBLESLAP, FIRE_FANG ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     EARTHQUAKE,   EARTH_POWER,      PSYCHIC_M,    MIMIC,        ICE_PUNCH,  \
	     ACCELEROCK,         METRONOME,    FIRE_PUNCH,   ICE_FANG,         EXTRASENSORY,      \
	     SUBSTITUTE,   SURF,         STRENGTH
	; end

	db BANK(PoliwrathPicFront)
