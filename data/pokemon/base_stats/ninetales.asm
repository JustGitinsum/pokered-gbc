	db DEX_NINETALES ; pokedex id

	db  73,  76,  75, 100, 100
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 75 ; catch rate
	db 178 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/ninetales.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/ninetales.pic", 0, 1 ; sprite dimensions
ENDC
	dw NinetalesPicFront, NinetalesPicBack

	db EMBER, TAIL_WHIP, DISABLE, MYSTICAL_FIRE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     TOXIC,          FIRE_FANG,      POWER_GEM,      HYPER_BEAM,     \
	     ANCIENTPOWER,   SIGNAL_BEAM,    ENERGY_BALL,    DIG,            PSYCHIC_M,      \
		 PSYBEAM,        DARK_PULSE,     ACCELEROCK,     FLASH_CANNON,   HEAT_CRASH,     \
		 SHADOW_BALL,    FLAMETHROWER,   MOONBLAST,      CUT,            FLASH 
	; end

	db BANK(NinetalesPicFront)
