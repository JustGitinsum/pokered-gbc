	db DEX_OMANYTE ; pokedex id

	db  35,  40, 100,  35,  90
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 120 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/omanyte.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/omanyte.pic", 0, 1 ; sprite dimensions
ENDC
	dw OmanytePicFront, OmanytePicBack

	db TRAILBLAZE, WITHDRAW, CONSTRICT, ANCIENTPOWER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    BULLDOZE,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     RAGE,         MIMIC,        \
	     ICE_PUNCH,  REFLECT,      ACCELEROCK,         ICE_FANG,         SUBSTITUTE,   \
	     SURF
	; end

	db BANK(OmanytePicFront)
