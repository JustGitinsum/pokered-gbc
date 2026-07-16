	db DEX_GOLEM ; pokedex id

	db  80, 110, 130,  45,  55
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 177 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/golem.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/golem.pic", 0, 1 ; sprite dimensions
ENDC
	dw GolemPicFront, GolemPicBack

	db TACKLE, DEFENSE_CURL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm CLOSE_COMBAT,   TOXIC,          POWER_GEM,      TRAILBLAZE,     HYPER_BEAM,     \
	     POISON_JAB,     ANCIENTPOWER,   MIGHTY_CLEAVE,  AURA_WHEEL,     EARTHQUAKE,     \
		 EARTH_POWER,    DIG,            ICE_PUNCH,      ACCELEROCK,     THUNDERPUNCH,   \
		 HEAT_CRASH,     FIRE_PUNCH,     AURA_SPHERE,    FLAMETHROWER,   STRENGTH 
	; end

	db BANK(GolemPicFront)
