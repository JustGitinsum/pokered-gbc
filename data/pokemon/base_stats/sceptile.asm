	db DEX_SCEPTILE ; pokedex id

	db  70,  85,  65,  120, 105, 85
	;   hp  atk  def  spd  sat  sdf

	db GRASS, DRAGON ; type
	db 45 ; catch rate
	db 239 ; base exp

	INCBIN "gfx/pokemon/gsfront/sceptile.pic", 0, 1 ; sprite dimensions
	dw SceptilePicFront, SceptilePicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      DRAGONBREATH,   CLOSE_COMBAT,   \
	     TOXIC,          X_SCISSOR,      TRAILBLAZE,     DRAGON_PULSE,   \
		 HYPER_BEAM,     SIGNAL_BEAM,    GIGA_DRAIN,     ENERGY_BALL,    \
		 MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    DIG,            \
	     ACCELEROCK,     LEAF_BLADE,     THUNDERPUNCH,   STEEL_WING,     \
	     DRAGON_CLAW,    PSYCHO_CUT,     CUT,            STRENGTH
	; end

	db BANK(SceptilePicFront)
