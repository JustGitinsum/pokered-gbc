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

	db CONFUSION, DISABLE, STEEL_WING, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SIGNAL_BEAM,      EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, \
	     RAGE,         ENERGY_BALL,    THUNDERFANG,  THUNDER,      PSYCHIC_M,    \
	     BRICK_BREAK,     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     METRONOME,    LEAF_BLADE, FIRE_BLAST,   FIRE_PUNCH,   ICE_FANG,         \
	     THUNDER_WAVE, PSYCHO_CUT,      FLAMETHROWER,   SUBSTITUTE,   STRENGTH,     \
	     FLASH
	; end

	db BANK(MewtwoPicFront)
