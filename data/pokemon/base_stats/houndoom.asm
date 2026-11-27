	db DEX_HOUNDOOM ; pokedex id

	db  75, 90,  50,  95,  110, 80
	;   hp  atk  def  spd  sat  sdf

	db DARK, FIRE ; type
	db 75 ; catch rate
	db 175 ; base exp

	INCBIN "gfx/pokemon/gsfront/houndoom.pic", 0, 1 ; sprite dimensions
	dw HoundoomPicFront, HoundoomPicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,          FIRE_FANG,      SLUDGE_BOMB,    TRAILBLAZE,     HYPER_BEAM,     \
	     POISON_JAB,     THUNDERFANG,    AURA_WHEEL,     EARTH_POWER,    DIG,            \
		 DARK_PULSE,     ACCELEROCK,     HEAT_CRASH,     SHADOW_CLAW,    FLAMETHROWER,   \
		 MOONBLAST,      STRENGTH,       FLASH
	; end

	db BANK(HoundoomPicFront)
		 