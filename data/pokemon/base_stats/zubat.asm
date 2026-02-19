	db DEX_ZUBAT ; pokedex id

	db  40,  45,  35,  55,  40
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 255 ; catch rate
	db 54 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/zubat.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/zubat.pic", 0, 1 ; sprite dimensions
ENDC
	dw ZubatPicFront, ZubatPicBack

	db MEGA_DRAIN, SUPERSONIC, GUST, BITE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,   WHIRLWIND,    TOXIC,        BULLDOZE,    DOUBLE_EDGE,  \
	     RAGE,         GIGA_DRAIN,   MIMIC,        ICE_PUNCH,  ACCELEROCK,         \
	     SWIFT,        ICE_FANG,         SUBSTITUTE
	; end

	db BANK(ZubatPicFront)
