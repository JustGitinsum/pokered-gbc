	db DEX_VILEPLUME ; pokedex id

	db  75,  80,  85,  50, 100
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 184 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/vileplume.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/vileplume.pic", 0, 1 ; sprite dimensions
ENDC
	dw VileplumePicFront, VileplumePicBack

	db STUN_SPORE, SLEEP_POWDER, ACID, PETAL_DANCE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        FIRE_FANG,    BULLDOZE,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         GIGA_DRAIN,   ENERGY_BALL,    MIMIC,        \
	     ICE_PUNCH,  REFLECT,      ACCELEROCK,         ICE_FANG,         SUBSTITUTE,   \
	     CUT
	; end

	db BANK(VileplumePicFront)
