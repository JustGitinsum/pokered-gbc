	db DEX_GLIGAR ; pokedex id

	db  65,  75, 105,  85,  35,  65
	;   hp  atk  def  spd  sat  sdf

	db GROUND, FLYING ; type
	db 255 ; catch rate
	db 86 ; base exp

	INCBIN "gfx/pokemon/gsfront/gligar.pic", 0, 1 ; sprite dimensions
	dw GligarPicFront, GligarPicBack

	db SCRATCH, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          \
	     X_SCISSOR,      FIRE_FANG,      SLUDGE_BOMB,    POISON_JAB,     MIGHTY_CLEAVE,  \
		 THUNDERFANG,    EARTHQUAKE,     EARTH_POWER,    DARK_PULSE,     ACCELEROCK,     \
		 LEAF_BLADE,     STEEL_WING,     SHADOW_CLAW,    DRAGON_CLAW,    ICE_FANG,       \
	     PSYCHO_CUT,     CUT
	; end

	db BANK(GligarPicFront)
