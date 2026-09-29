	db DEX_ZORUA ; pokedex id

	db  40,  65,  40,  65, 80
	;   hp  atk  def  spd  spc

	db GHOST, NORMAL ; type
	db 215 ; catch rate
	db 66 ; base exp

	INCBIN "gfx/pokemon/gsfront/zorua_h.pic", 0, 1 ; sprite dimensions
	dw ZoruaHPicFront, ZoruaHPicBack

	db SCRATCH, LEER, SHARPEN, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          SLUDGE_BOMB,    \
	     TRAILBLAZE,     DIG,            PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     \
		 ACCELEROCK,     SHADOW_BALL,    AURA_SPHERE,    FLAMETHROWER,   MOONBLAST,      \
	     CUT,            FLASH
	; end

	db BANK(ZoruaHPicFront)
