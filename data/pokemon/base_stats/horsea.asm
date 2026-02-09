	db DEX_HORSEA ; pokedex id

	db  30,  40,  70,  60,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 83 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/horsea.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/horsea.pic", 0, 1 ; sprite dimensions
ENDC
	dw HorseaPicFront, HorseaPicBack

	db BUBBLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    \
	     ICE_BEAM,     BLIZZARD,     RAGE,         MIMIC,        ICE_PUNCH,  \
	     ACCELEROCK,         SWIFT,        FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE,   \
	     SURF
	; end

	db BANK(HorseaPicFront)
