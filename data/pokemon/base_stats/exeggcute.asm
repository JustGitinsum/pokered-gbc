	db DEX_EXEGGCUTE ; pokedex id

	db  60,  40,  80,  40,  60
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC_TYPE ; type
	db 90 ; catch rate
	db 98 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/exeggcute.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/exeggcute.pic", 0, 1 ; sprite dimensions
ENDC
	dw ExeggcutePicFront, ExeggcutePicBack

	db BULLET_SEED, HYPNOSIS, LEECH_SEED, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,          SLUDGE_BOMB,    TRAILBLAZE,     SPORE,          ANCIENTPOWER,   \
	     SIGNAL_BEAM,    GIGA_DRAIN,     ENERGY_BALL,    EARTHQUAKE,     EARTH_POWER,    \
		 PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     ACCELEROCK,     MOONBLAST,      \
		 STRENGTH,       FLASH 
	; end

	db BANK(ExeggcutePicFront)
