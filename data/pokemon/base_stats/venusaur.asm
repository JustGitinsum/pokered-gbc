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
	tmhm DRAGONBREATH,   TOXIC,          SLUDGE_BOMB,    TRAILBLAZE,     DRAGON_PULSE,   \
	     HYPER_BEAM,     SPORE,          POISON_JAB,     ANCIENTPOWER,   SIGNAL_BEAM,    \
	     GIGA_DRAIN,     ENERGY_BALL,    MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    \
		 ACCELEROCK,     LEAF_BLADE,     MOONBLAST,      CUT,            STRENGTH,       \
		 FLASH 
	; end

	db BANK(VenusaurPicFront)
