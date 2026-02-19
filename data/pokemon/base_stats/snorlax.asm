	db DEX_SNORLAX ; pokedex id

	db 160, 110,  65,  30,  65
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 25 ; catch rate
	db 154 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/snorlax.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/snorlax.pic", 0, 1 ; sprite dimensions
ENDC
	dw SnorlaxPicFront, SnorlaxPicBack

	db BITE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   PAY_DAY,      EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         ENERGY_BALL,    THUNDERFANG,  THUNDER,      EARTHQUAKE,   \
	     EARTH_POWER,      PSYCHIC_M,    MIMIC,        ICE_PUNCH,  REFLECT,      \
	     ACCELEROCK,         METRONOME,    SELFDESTRUCT, FIRE_BLAST,   FIRE_PUNCH,   \
	     ICE_FANG,         EXTRASENSORY,      THUNDERBOLT,   SUBSTITUTE,   SURF,         \
	     STRENGTH
	; end

	db BANK(SnorlaxPicFront)
