	db DEX_SIRFETCHD ; pokedex id

	db  62, 135, 95,  65,  68,  82
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 177 ; base exp

	INCBIN "gfx/pokemon/gsfront/sirfetchd.pic", 0, 1 ; sprite dimensions
	dw SirfetchdPicFront, SirfetchdPicBack

	db PECK, SAND_ATTACK, LEER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      \
	     TRAILBLAZE,     HYPER_BEAM,     POISON_JAB,     MIGHTY_CLEAVE,  GLACIAL_LANCE,  \
		 ACCELEROCK,     LEAF_BLADE,     STEEL_WING,     AURA_SPHERE,    CUT,            \
		 FLY,            STRENGTH 
	; end

	db BANK(SirfetchdPicFront)
