	db DEX_IVYSAUR ; pokedex id

	db  60,  62,  63,  60,  80
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 141 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/ivysaur.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/ivysaur.pic", 0, 1 ; sprite dimensions
ENDC
	dw IvysaurPicFront, IvysaurPicBack

	db TACKLE, GROWL, LEECH_SEED, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm DRAGONBREATH,   TOXIC,          SLUDGE_BOMB,    TRAILBLAZE,     DRAGON_PULSE,   \
	     HYPER_BEAM,     SPORE,          POISON_JAB,     ANCIENTPOWER,   SIGNAL_BEAM,    \
	     GIGA_DRAIN,     ENERGY_BALL,    MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    \
		 ACCELEROCK,     LEAF_BLADE,     MOONBLAST,      CUT,            STRENGTH,       \
		 FLASH 
	; end

	db BANK(IvysaurPicFront)
