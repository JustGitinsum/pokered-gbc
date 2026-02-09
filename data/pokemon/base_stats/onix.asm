	db DEX_ONIX ; pokedex id

	db  35,  45, 160,  70,  30
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 108 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/onix.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/onix.pic", 0, 1 ; sprite dimensions
ENDC
	dw OnixPicFront, OnixPicBack

	db TACKLE, SCREECH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     EARTHQUAKE,   EARTH_POWER,      DIG,          MIMIC,        ICE_PUNCH,  \
	     ACCELEROCK,         SELFDESTRUCT, FIRE_PUNCH,   ICE_FANG,         EXPLOSION,    \
	     THUNDERBOLT,   SUBSTITUTE,   STRENGTH
	; end

	db BANK(OnixPicFront)
