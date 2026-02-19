	db DEX_PIDGEY ; pokedex id

	db  40,  45,  40,  56,  35
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 255 ; catch rate
	db 55 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/pidgey.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/pidgey.pic", 0, 1 ; sprite dimensions
ENDC
	dw PidgeyPicFront, PidgeyPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,   WHIRLWIND,    TOXIC,        BULLDOZE,    DOUBLE_EDGE,  \
	     RAGE,         MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     SWIFT,        SKY_ATTACK,   ICE_FANG,         SUBSTITUTE,   FLY
	; end

	db BANK(PidgeyPicFront)
