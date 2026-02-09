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
	tmhm AERIAL_ACE,   MEGA_KICK,    TOXIC,        FIRE_FANG,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         GIGA_DRAIN,   THUNDERFANG,  THUNDER,      PSYCHIC_M,    \
	     MIMIC,        ICE_PUNCH,  ACCELEROCK,         METRONOME,    SELFDESTRUCT, \
	     FIRE_PUNCH,   DREAM_EATER,  ICE_FANG,         EXTRASENSORY,      EXPLOSION,    \
	     SUBSTITUTE,   STRENGTH
	; end

	db BANK(GengarPicFront)
