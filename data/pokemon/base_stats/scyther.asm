	db DEX_SCYTHER ; pokedex id

	db  70, 110,  80, 105,  55
	;   hp  atk  def  spd  spc

	db BUG, FLYING ; type
	db 45 ; catch rate
	db 187 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/scyther.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/scyther.pic", 0, 1 ; sprite dimensions
ENDC
	dw ScytherPicFront, ScytherPicBack

	db QUICK_ATTACK, LEER, POUNCE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      \
	     TRAILBLAZE,     HYPER_BEAM,     POISON_JAB,     MIGHTY_CLEAVE,  ACCELEROCK,     \
		 LEAF_BLADE,     STEEL_WING,     SHADOW_CLAW,    DRAGON_CLAW,    PSYCHO_CUT,     \
		 CUT,            FLY,            STRENGTH 
	; end

	db BANK(ScytherPicFront)
