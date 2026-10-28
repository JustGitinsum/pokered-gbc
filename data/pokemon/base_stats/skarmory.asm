	db DEX_SKARMORY ; pokedex id

	db 65, 80, 140, 70, 40
	;   hp  atk  def  spd  spc

	db STEEL, FLYING ; type
	db 90 ; catch rate
	db 163 ; base exp

	INCBIN "gfx/pokemon/gsfront/skarmory.pic", 0, 1 ; sprite dimensions
	dw SkarmoryPicFront, SkarmoryPicBack

	db LEER, PECK, SILVER_WIND, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      TOXIC,          X_SCISSOR,      HYPER_BEAM,     \
	     MIGHTY_CLEAVE,  DARK_PULSE,     GLACIAL_LANCE,  ACCELEROCK,     FLASH_CANNON,   \
	     STEEL_WING,     SHADOW_CLAW,    CUT,            FLY
	; end

	db BANK(SkarmoryPicFront)
