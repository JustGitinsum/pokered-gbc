	db DEX_CHARMANDER ; pokedex id

	db  39,  52,  43,  65,  50
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 65 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/charmander.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/charmander.pic", 0, 1 ; sprite dimensions
ENDC
	dw CharmanderPicFront, CharmanderPicBack

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          FIRE_FANG,      \
	     DRAGON_PULSE,   HYPER_BEAM,     ANCIENTPOWER,   MIGHTY_CLEAVE,  EARTHQUAKE,     \
		 EARTH_POWER,    DIG,            ACCELEROCK,     THUNDERPUNCH,   HEAT_CRASH,     \
		 FIRE_PUNCH,     SHADOW_CLAW,    DRAGON_CLAW,    FLAMETHROWER,   CUT,            \
		 STRENGTH,       FLASH 
	; end

	db BANK(CharmanderPicFront)
