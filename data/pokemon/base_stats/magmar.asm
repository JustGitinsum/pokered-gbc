	db DEX_MAGMAR ; pokedex id

	db  65,  95,  57,  93,  85
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 167 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/magmar.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/magmar.pic", 0, 1 ; sprite dimensions
ENDC
	dw MagmarPicFront, MagmarPicBack

	db EMBER, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          DRAGON_PULSE,   HYPER_BEAM,     \
	     POISON_JAB,     SIGNAL_BEAM,    EARTHQUAKE,     PSYCHIC_M,      PSYBEAM,        \
	     DARK_PULSE,     FLASH_CANNON,   THUNDERPUNCH,   HEAT_CRASH,     FIRE_PUNCH,     \
	     THUNDER_WAVE,   THUNDERBOLT,    FLAMETHROWER,   MOONBLAST,      STRENGTH,       \
		 FLASH 
	; end

	db BANK(MagmarPicFront)
