	db DEX_TREECKO ; pokedex id

	db  40,  45,  35,  70,  65, 70
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 180 ; catch rate
	db 62 ; base exp

	INCBIN "gfx/pokemon/gsfront/treecko.pic", 0, 1 ; sprite dimensions
	dw TreeckoPicFront, TreeckoPicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      DRAGONBREATH,   CLOSE_COMBAT,   \
	     TOXIC,          X_SCISSOR,      TRAILBLAZE,     DRAGON_PULSE,   \
		 SIGNAL_BEAM,    GIGA_DRAIN,     ENERGY_BALL,    MIGHTY_CLEAVE,  \
		 DIG,            ACCELEROCK,     THUNDERPUNCH,   CUT,            \
		 STRENGTH
	; end

	db BANK(TreeckoPicFront)
