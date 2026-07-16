	db DEX_DODRIO ; pokedex id

	db  60, 110,  70, 100,  60
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 158 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/dodrio.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/dodrio.pic", 0, 1 ; sprite dimensions
ENDC
	dw DodrioPicFront, DodrioPicBack

	db PECK, GROWL, QUICK_ATTACK, TRI_ATTACK ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      \
	     TRAILBLAZE,     HYPER_BEAM,     POISON_JAB,     ACCELEROCK,     STEEL_WING,     \
		 SHADOW_CLAW,    CUT,            FLY,            STRENGTH 
	; end

	db BANK(DodrioPicFront)
