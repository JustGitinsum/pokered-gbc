	db DEX_GASTLY ; pokedex id

	db  30,  35,  30,  80, 100
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 190 ; catch rate
	db 95 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/gastly.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/gastly.pic", 0, 1 ; sprite dimensions
ENDC
	dw GastlyPicFront, GastlyPicBack

	db LICK, CONFUSE_RAY, OMINOUS_WIND, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        RAGE,         GIGA_DRAIN,   THUNDERFANG,  THUNDER,      \
	     PSYCHIC_M,    MIMIC,        ICE_PUNCH,  ACCELEROCK,         SELFDESTRUCT, \
	     DREAM_EATER,  ICE_FANG,         EXTRASENSORY,      EXPLOSION,    SUBSTITUTE
	; end

	db BANK(GastlyPicFront)
