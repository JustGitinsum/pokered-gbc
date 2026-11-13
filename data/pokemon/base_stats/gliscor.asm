	db DEX_GLISCOR ; pokedex id

	db  75,  95, 125,  95,  45,  75
	;   hp  atk  def  spd  sat  sdf

	db GROUND, FLYING ; type
	db 120 ; catch rate
	db 179 ; base exp

	INCBIN "gfx/pokemon/gsfront/gliscor.pic", 0, 1 ; sprite dimensions
	dw GliscorPicFront, GliscorPicBack

	db SCRATCH, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          \
	     X_SCISSOR,      FIRE_FANG,      SLUDGE_BOMB,    HYPER_BEAM,     POISON_JAB,     \
		 MIGHTY_CLEAVE,  THUNDERFANG,    EARTHQUAKE,     EARTH_POWER,    DARK_PULSE,     \
		 ACCELEROCK,     LEAF_BLADE,     STEEL_WING,     SHADOW_CLAW,    DRAGON_CLAW,    \
		 ICE_FANG,       PSYCHO_CUT,     CUT,            FLY,            STRENGTH
	; end

	db BANK(GliscorPicFront)
