	db DEX_KRABBY ; pokedex id

	db  30, 105,  90,  50,  25
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 115 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/krabby.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/krabby.pic", 0, 1 ; sprite dimensions
ENDC
	dw KrabbyPicFront, KrabbyPicBack

	db BUBBLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     RAGE,         \
	     MIMIC,        ICE_PUNCH,  ACCELEROCK,         ICE_FANG,         SUBSTITUTE,   \
	     CUT,          SURF,         STRENGTH
	; end

	db BANK(KrabbyPicFront)
