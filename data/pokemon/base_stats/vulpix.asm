	db DEX_VULPIX ; pokedex id

	db  38,  41,  40,  65,  65
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 190 ; catch rate
	db 63 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/vulpix.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/vulpix.pic", 0, 1 ; sprite dimensions
ENDC
	dw VulpixPicFront, VulpixPicBack

	db EMBER, TAIL_WHIP, DISABLE, QUICK_ATTACK ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    BULLDOZE,    DOUBLE_EDGE,  RAGE,         \
	     DIG,          MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     FIRE_BLAST,   SWIFT,        FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE
	; end

	db BANK(VulpixPicFront)
