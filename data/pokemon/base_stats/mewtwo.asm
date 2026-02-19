	db DEX_MEWTWO ; pokedex id

	db 106, 110,  90, 130, 154
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 3 ; catch rate
	db 220 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/mewtwo.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/mewtwo.pic", 0, 1 ; sprite dimensions
ENDC
	dw MewtwoPicFront, MewtwoPicBack

	db CONFUSION, DISABLE, SWIFT, ANCIENTPOWER ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   PAY_DAY,      EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         ENERGY_BALL,    THUNDERFANG,  THUNDER,      PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     METRONOME,    SELFDESTRUCT, FIRE_BLAST,   FIRE_PUNCH,   ICE_FANG,         \
	     THUNDER_WAVE, EXTRASENSORY,      FLAMETHROWER,   SUBSTITUTE,   STRENGTH,     \
	     FLASH
	; end

	db BANK(MewtwoPicFront)
