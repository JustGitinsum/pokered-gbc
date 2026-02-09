	db DEX_WEEPINBELL ; pokedex id

	db  65,  90,  50,  55,  85
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 120 ; catch rate
	db 151 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/weepinbell.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/weepinbell.pic", 0, 1 ; sprite dimensions
ENDC
	dw WeepinbellPicFront, WeepinbellPicBack

	db VINE_WHIP, GROWTH, WRAP, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     GIGA_DRAIN,   ENERGY_BALL,    MIMIC,        ICE_PUNCH,  REFLECT,      \
	     ACCELEROCK,         ICE_FANG,         SUBSTITUTE,   CUT
	; end

	db BANK(WeepinbellPicFront)
