	db DEX_ZOROARK ; pokedex id

	db  55, 100, 60, 110, 125,  60
	;   hp  atk  def  spd  sat  sdf

	db GHOST, NORMAL ; type
	db 45 ; catch rate
	db 179 ; base exp

	INCBIN "gfx/pokemon/gsfront/zoroark_h.pic", 0, 1 ; sprite dimensions
	dw ZoroarkHPicFront, ZoroarkHPicBack

	db SCRATCH, LEER, SHARPEN, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      \
	     SLUDGE_BOMB,    TRAILBLAZE,     HYPER_BEAM,     POISON_JAB,     DIG,            \
		 PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     ACCELEROCK,     SHADOW_CLAW,    \
		 SHADOW_BALL,    PSYCHO_CUT,     AURA_SPHERE,    FLAMETHROWER,   MOONBLAST,      \
	     CUT,            STRENGTH,       FLASH
	; end

	db BANK(ZoroarkHPicFront)
