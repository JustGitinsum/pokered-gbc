	db DEX_EXEGGUTOR ; pokedex id

	db  95,  95,  85,  55, 125
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 212 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/exeggutor.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/exeggutor.pic", 0, 1 ; sprite dimensions
ENDC
	dw ExeggutorPicFront, ExeggutorPicBack

	db BULLET_SEED, HYPNOSIS, STOMP, LEECH_SEED ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,          SLUDGE_BOMB,    TRAILBLAZE,     HYPER_BEAM,     SPORE,          \
	     ANCIENTPOWER,   SIGNAL_BEAM,    GIGA_DRAIN,     ENERGY_BALL,    EARTHQUAKE,     \
		 EARTH_POWER,    PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     ACCELEROCK,     \
		 LEAF_BLADE,     PSYCHO_CUT,     MOONBLAST,      STRENGTH,       FLASH 
	; end

	db BANK(ExeggutorPicFront)
