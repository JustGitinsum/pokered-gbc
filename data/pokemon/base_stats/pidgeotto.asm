	db DEX_PIDGEOTTO ; pokedex id

	db  63,  60,  55,  71,  50
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 120 ; catch rate
	db 113 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/pidgeotto.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/pidgeotto.pic", 0, 1 ; sprite dimensions
ENDC
	dw PidgeottoPicFront, PidgeottoPicBack

	db GUST, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,   WHIRLWIND,    TOXIC,        BULLDOZE,    DOUBLE_EDGE,  \
	     RAGE,         MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     SWIFT,        SKY_ATTACK,   ICE_FANG,         SUBSTITUTE,   FLY
	; end

	db BANK(PidgeottoPicFront)
