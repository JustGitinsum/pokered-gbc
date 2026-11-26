	db DEX_GROVYLE ; pokedex id

	db  50,  65,  45,  95,  85,  65
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 90 ; catch rate
	db 142 ; base exp

	INCBIN "gfx/pokemon/gsfront/grovyle.pic", 0, 1 ; sprite dimensions
	dw GrovylePicFront, GrovylePicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      DRAGONBREATH,   CLOSE_COMBAT,   \
	     TOXIC,          X_SCISSOR,      TRAILBLAZE,     DRAGON_PULSE,   \
		 SIGNAL_BEAM,    GIGA_DRAIN,     ENERGY_BALL,    MIGHTY_CLEAVE,  \
		 DIG,            ACCELEROCK,     LEAF_BLADE,     THUNDERPUNCH,   \
		 STEEL_WING,     DRAGON_CLAW,    PSYCHO_CUT,     CUT,            \
		 STRENGTH
	; end

	db BANK(GrovylePicFront)
