	db DEX_CHARIZARD ; pokedex id

	db  78,  84,  78, 100,  85
	;   hp  atk  def  spd  spc

	db FIRE, FLYING ; type
	db 45 ; catch rate
	db 209 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/charizard.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/charizard.pic", 0, 1 ; sprite dimensions
ENDC
	dw CharizardPicFront, CharizardPicBack

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          \
	     FIRE_FANG,      DRAGON_PULSE,   HYPER_BEAM,     ANCIENTPOWER,   MIGHTY_CLEAVE,  \
		 EARTHQUAKE,     EARTH_POWER,    DIG,            ACCELEROCK,     THUNDERPUNCH,   \
		 HEAT_CRASH,     STEEL_WING,     FIRE_PUNCH,     SHADOW_CLAW,    DRAGON_CLAW,    \
		 FLAMETHROWER,   CUT,            FLY,            STRENGTH,       FLASH 
	; end

	db BANK(CharizardPicFront)
