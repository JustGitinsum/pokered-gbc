	db DEX_DODUO ; pokedex id

	db  35,  85,  45,  75,  35
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 190 ; catch rate
	db 96 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/doduo.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/doduo.pic", 0, 1 ; sprite dimensions
ENDC
	dw DoduoPicFront, DoduoPicBack

	db PECK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm WHIRLWIND,    TOXIC,        FIRE_FANG,    BULLDOZE,    DOUBLE_EDGE,  \
	     RAGE,         MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     FIRE_PUNCH,   SKY_ATTACK,   ICE_FANG,         FLAMETHROWER,   SUBSTITUTE,   \
	     FLY
	; end

	db BANK(DoduoPicFront)
