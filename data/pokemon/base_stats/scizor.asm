	db DEX_SCIZOR ; pokedex id

	db  70, 130,  100, 65,  80
	;   hp  atk  def  spd  spc

	db BUG, STEEL ; type
	db 45 ; catch rate
	db 175 ; base exp

	INCBIN "gfx/pokemon/gsfront/scizor.pic", 0, 1 ; sprite dimensions
	dw ScizorPicFront, ScizorPicBack

	db QUICK_ATTACK, LEER, POUNCE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      \
	     TRAILBLAZE,     HYPER_BEAM,     POISON_JAB,     MIGHTY_CLEAVE,  ACCELEROCK,     \
		 LEAF_BLADE,     STEEL_WING,     SHADOW_CLAW,    DRAGON_CLAW,    PSYCHO_CUT,     \
		 CUT,            FLY,            STRENGTH 
	; end

	db BANK(ScizorPicFront)
