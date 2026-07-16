	db DEX_CHARMELEON ; pokedex id

	db  58,  64,  58,  80,  65
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 142 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/charmeleon.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/charmeleon.pic", 0, 1 ; sprite dimensions
ENDC
	dw CharmeleonPicFront, CharmeleonPicBack

	db SCRATCH, GROWL, EMBER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          FIRE_FANG,      \
	     DRAGON_PULSE,   HYPER_BEAM,     ANCIENTPOWER,   MIGHTY_CLEAVE,  EARTHQUAKE,     \
		 EARTH_POWER,    DIG,            ACCELEROCK,     THUNDERPUNCH,   HEAT_CRASH,     \
		 FIRE_PUNCH,     SHADOW_CLAW,    DRAGON_CLAW,    FLAMETHROWER,   CUT,            \
		 STRENGTH,       FLASH 
	; end

	db BANK(CharmeleonPicFront)
