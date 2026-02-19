	db DEX_BULBASAUR ; pokedex id

	db  45,  49,  49,  45,  65
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 64 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/bulbasaur.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/bulbasaur.pic", 0, 1 ; sprite dimensions
ENDC
	dw BulbasaurPicFront, BulbasaurPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        FIRE_FANG,    BULLDOZE,    DOUBLE_EDGE,  \
	     RAGE,         GIGA_DRAIN,   ENERGY_BALL,    MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         ICE_FANG,         SUBSTITUTE,   CUT
	; end

	db BANK(BulbasaurPicFront)
