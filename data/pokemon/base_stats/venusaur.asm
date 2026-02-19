	db DEX_VENUSAUR ; pokedex id

	db  80,  82,  83,  80, 100
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 208 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/venusaur.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/venusaur.pic", 0, 1 ; sprite dimensions
ENDC
	dw VenusaurPicFront, VenusaurPicBack

	db TACKLE, GROWL, LEECH_SEED, VINE_WHIP ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        FIRE_FANG,    BULLDOZE,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         GIGA_DRAIN,   ENERGY_BALL,    MIMIC,        \
	     ICE_PUNCH,  REFLECT,      ACCELEROCK,         ICE_FANG,         SUBSTITUTE,   \
	     CUT
	; end

	db BANK(VenusaurPicFront)
