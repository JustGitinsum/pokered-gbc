	db DEX_ROTOM ; pokedex id

	db  50, 50,  77,  91,  95,  77
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, GHOST ; type
	db 45 ; catch rate
	db 154 ; base exp

	INCBIN "gfx/pokemon/gsfront/rotom.pic", 0, 1 ; sprite dimensions
	dw RotomPicFront, RotomPicBack

	db THUNDERSHOCK, DOUBLE_TEAM, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,          HYPER_BEAM,     SIGNAL_BEAM,    ENERGY_BALL,    PSYCHIC_M,      \
	     PSYBEAM,        DARK_PULSE,     FLASH_CANNON,   SHADOW_BALL,    THUNDER_WAVE,   \
	     THUNDERBOLT,    FLASH
	; end

	db BANK(RotomPicFront)
