	db DEX_HYPNO ; pokedex id

	db  85,  73,  70,  67, 115
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 75 ; catch rate
	db 165 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/hypno.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/hypno.pic", 0, 1 ; sprite dimensions
ENDC
	dw HypnoPicFront, HypnoPicBack

	db POUND, HYPNOSIS, DISABLE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, \
	     RAGE,         PSYCHIC_M,    BRICK_BREAK,     MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         METRONOME,    FIRE_PUNCH,   SHADOW_BALL,  \
	     ICE_FANG,         THUNDER_WAVE, PSYCHO_CUT,      FLAMETHROWER,   SUBSTITUTE,   \
	     FLASH
	; end

	db BANK(HypnoPicFront)
