	db DEX_MAGMORTAR ; pokedex id

	db  75,  95,  67,  83, 125,  95
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 243 ; base exp

	INCBIN "gfx/pokemon/gsfront/magmortar.pic", 0, 1 ; sprite dimensions
	dw MagmortarPicFront, MagmortarPicBack

	db QUICK_ATTACK, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          DRAGON_PULSE,   HYPER_BEAM,     \
	     POISON_JAB,     SIGNAL_BEAM,    EARTHQUAKE,     PSYCHIC_M,      PSYBEAM,        \
	     DARK_PULSE,     FLASH_CANNON,   THUNDERPUNCH,   HEAT_CRASH,     FIRE_PUNCH,     \
	     THUNDER_WAVE,   THUNDERBOLT,    FLAMETHROWER,   MOONBLAST,      STRENGTH,       \
		 FLASH 
	; end

	db BANK(MagmortarPicFront)
