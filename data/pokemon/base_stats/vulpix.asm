	db DEX_VULPIX ; pokedex id

	db  38,  41,  40,  65,  65
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 190 ; catch rate
	db 63 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/vulpix.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/vulpix.pic", 0, 1 ; sprite dimensions
ENDC
	dw VulpixPicFront, VulpixPicBack

	db EMBER, TAIL_WHIP, DISABLE, QUICK_ATTACK ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     TOXIC,          FIRE_FANG,      POWER_GEM,      HYPER_BEAM,     \
	     ANCIENTPOWER,   SIGNAL_BEAM,    ENERGY_BALL,    DIG,            PSYCHIC_M,      \
		 PSYBEAM,        DARK_PULSE,     ACCELEROCK,     FLASH_CANNON,   HEAT_CRASH,     \
		 SHADOW_BALL,    FLAMETHROWER,   MOONBLAST,      CUT,            FLASH 
	; end

	db BANK(VulpixPicFront)
