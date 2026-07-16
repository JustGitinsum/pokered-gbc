	db DEX_MAROWAK ; pokedex id

	db  60,  80, 110,  45,  50
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 75 ; catch rate
	db 124 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/marowak.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/marowak.pic", 0, 1 ; sprite dimensions
ENDC
	dw MarowakPicFront, MarowakPicBack

	db TACKLE, GROWL, LEER, FOCUS_ENERGY ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      \
	     POWER_GEM,      BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       HYPER_BEAM,     \
	     POISON_JAB,     ANCIENTPOWER,   MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    \
		 DIG,            ACCELEROCK,     THUNDERPUNCH,   HEAT_CRASH,     FIRE_PUNCH,     \
	     SHADOW_CLAW,    PSYCHO_CUT,     FLAMETHROWER,   CUT,            STRENGTH 
	; end

	db BANK(MarowakPicFront)
