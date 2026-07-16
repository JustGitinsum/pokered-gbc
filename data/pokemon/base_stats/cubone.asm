	db DEX_CUBONE ; pokedex id

	db  50,  50,  95,  35,  40
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 190 ; catch rate
	db 87 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/cubone.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/cubone.pic", 0, 1 ; sprite dimensions
ENDC
	dw CubonePicFront, CubonePicBack

	db TACKLE, GROWL, TAIL_WHIP, LEER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      \
	     POWER_GEM,      BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       HYPER_BEAM,     \
	     POISON_JAB,     ANCIENTPOWER,   MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    \
		 DIG,            ACCELEROCK,     THUNDERPUNCH,   HEAT_CRASH,     FIRE_PUNCH,     \
	     SHADOW_CLAW,    PSYCHO_CUT,     FLAMETHROWER,   CUT,            STRENGTH 
	; end

	db BANK(CubonePicFront)
