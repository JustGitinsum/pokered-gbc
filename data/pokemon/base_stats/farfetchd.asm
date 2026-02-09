	db DEX_FARFETCHD ; pokedex id

	db  52,  65,  55,  60,  58
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 94 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/farfetchd.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/farfetchd.pic", 0, 1 ; sprite dimensions
ENDC
	dw FarfetchdPicFront, FarfetchdPicBack

	db PECK, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,   SWORDS_DANCE, WHIRLWIND,    TOXIC,        FIRE_FANG,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         SWIFT,        FIRE_PUNCH,   ICE_FANG,         \
	     SUBSTITUTE,   CUT,          FLY
	; end

	db BANK(FarfetchdPicFront)
