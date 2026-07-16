	db DEX_GEODUDE ; pokedex id

	db  40,  80, 100,  20,  30
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 255 ; catch rate
	db 86 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/geodude.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/geodude.pic", 0, 1 ; sprite dimensions
ENDC
	dw GeodudePicFront, GeodudePicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm CLOSE_COMBAT,   TOXIC,          POWER_GEM,      TRAILBLAZE,     HYPER_BEAM,     \
	     POISON_JAB,     ANCIENTPOWER,   MIGHTY_CLEAVE,  AURA_WHEEL,     EARTHQUAKE,     \
		 EARTH_POWER,    DIG,            ICE_PUNCH,      ACCELEROCK,     THUNDERPUNCH,   \
		 HEAT_CRASH,     FIRE_PUNCH,     AURA_SPHERE,    FLAMETHROWER,   STRENGTH 
	; end

	db BANK(GeodudePicFront)
