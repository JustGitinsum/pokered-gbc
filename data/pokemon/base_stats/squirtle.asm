	db DEX_SQUIRTLE ; pokedex id

	db  44,  48,  65,  43,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 66 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/squirtle.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/squirtle.pic", 0, 1 ; sprite dimensions
ENDC
	dw SquirtlePicFront, SquirtlePicBack

	db POUND, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, RAGE,         DIG,          \
	     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         FIRE_PUNCH,   \
	     ICE_FANG,         SUBSTITUTE,   SURF,         STRENGTH
	; end

	db BANK(SquirtlePicFront)
