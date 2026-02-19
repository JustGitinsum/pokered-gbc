	db DEX_CHANSEY ; pokedex id

	db 250,   5,   5,  50, 105
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 30 ; catch rate
	db 255 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/chansey.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/chansey.pic", 0, 1 ; sprite dimensions
ENDC
	dw ChanseyPicFront, ChanseyPicBack

	db POUND, DOUBLESLAP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     ENERGY_BALL,    THUNDERFANG,  THUNDER,      PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         METRONOME,    \
	     THUNDERPUNCH,     FIRE_BLAST,   FIRE_PUNCH,   SOFTBOILED,   ICE_FANG,         \
	     THUNDER_WAVE, EXTRASENSORY,      FLAMETHROWER,   SUBSTITUTE,   STRENGTH,     \
	     FLASH
	; end

	db BANK(ChanseyPicFront)
