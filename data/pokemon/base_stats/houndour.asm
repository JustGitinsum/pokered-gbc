	db DEX_HOUNDOUR ; pokedex id

	db  45,  60,  30,  65,  80, 50
	;   hp  atk  def  spd  sat  sdf

	db DARK, FIRE ; type
	db 190 ; catch rate
	db 66 ; base exp

	INCBIN "gfx/pokemon/gsfront/houndour.pic", 0, 1 ; sprite dimensions
	dw HoundourPicFront, HoundourPicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,          FIRE_FANG,      SLUDGE_BOMB,    TRAILBLAZE,     POISON_JAB,     \
	     THUNDERFANG,    DIG,            ACCELEROCK,     HEAT_CRASH,     SHADOW_CLAW,    \
		 FLAMETHROWER,   STRENGTH,       FLASH
	; end

	db BANK(HoundourPicFront)
