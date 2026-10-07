	db DEX_CHARCADET ; pokedex id

	db  40,  50,  40,  35,  50
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 120 ; catch rate
	db 51 ; base exp

	INCBIN "gfx/pokemon/gsfront/charcadet.pic", 0, 1 ; sprite dimensions
	dw CharcadetPicFront, CharcadetPicBack

	db EMBER, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

; tm/hm learnset
	tmhm POISON_JAB,     DIG,            HEAT_CRASH,     FIRE_PUNCH,     FLAMETHROWER,   \
	     STRENGTH,       FLASH
	; end

	db BANK(CharcadetPicFront)
