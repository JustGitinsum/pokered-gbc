	db DEX_GENGAR ; pokedex id

	db  60,  65,  60, 110, 130
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 45 ; catch rate
	db 190 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/gengar.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/gengar.pic", 0, 1 ; sprite dimensions
ENDC
	dw GengarPicFront, GengarPicBack

	db LICK, CONFUSE_RAY, OMINOUS_WIND, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, \
	     RAGE,         GIGA_DRAIN,   THUNDERFANG,  THUNDER,      PSYCHIC_M,    \
	     MIMIC,        ICE_PUNCH,  ACCELEROCK,         METRONOME,    LEAF_BLADE, \
	     FIRE_PUNCH,   SHADOW_BALL,  ICE_FANG,         PSYCHO_CUT,      AURA_SPHERE,    \
	     SUBSTITUTE,   STRENGTH
	; end

	db BANK(GengarPicFront)
