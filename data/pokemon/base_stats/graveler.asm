	db DEX_GRAVELER ; pokedex id

	db  55,  95, 115,  35,  45
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 120 ; catch rate
	db 134 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/graveler.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/graveler.pic", 0, 1 ; sprite dimensions
ENDC
	dw GravelerPicFront, GravelerPicBack

	db TACKLE, DEFENSE_CURL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm CLOSE_COMBAT,   TOXIC,          POWER_GEM,      TRAILBLAZE,     HYPER_BEAM,     \
	     POISON_JAB,     ANCIENTPOWER,   MIGHTY_CLEAVE,  AURA_WHEEL,     EARTHQUAKE,     \
		 EARTH_POWER,    DIG,            ICE_PUNCH,      ACCELEROCK,     THUNDERPUNCH,   \
		 HEAT_CRASH,     FIRE_PUNCH,     AURA_SPHERE,    FLAMETHROWER,   STRENGTH 
	; end

	db BANK(GravelerPicFront)
