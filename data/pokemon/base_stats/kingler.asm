	db DEX_KINGLER ; pokedex id

	db  55, 130, 115,  75,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 60 ; catch rate
	db 206 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/kingler.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/kingler.pic", 0, 1 ; sprite dimensions
ENDC
	dw KinglerPicFront, KinglerPicBack

	db BUBBLE, LEER, VICEGRIP, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     RAGE,         MIMIC,        ICE_PUNCH,  ACCELEROCK,         ICE_FANG,         \
	     SUBSTITUTE,   CUT,          SURF,         STRENGTH
	; end

	db BANK(KinglerPicFront)
