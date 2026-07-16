	db DEX_FARFETCHD ; pokedex id

	db  52,  65,  55,  60,  58
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 94 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/farfetchd.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/farfetchd.pic", 0, 1 ; sprite dimensions
ENDC
	dw FarfetchdPicFront, FarfetchdPicBack

	db PECK, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      \
	     TRAILBLAZE,     HYPER_BEAM,     SPORE,          POISON_JAB,     MIGHTY_CLEAVE,  \
		 GLACIAL_LANCE,  ACCELEROCK,     LEAF_BLADE,     STEEL_WING,     AURA_SPHERE,    \
		 CUT,            FLY,            STRENGTH 
	; end

	db BANK(FarfetchdPicFront)
