	db DEX_KABUTO ; pokedex id

	db  30,  80,  90,  55,  45
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 119 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/kabuto.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/kabuto.pic", 0, 1 ; sprite dimensions
ENDC
	dw KabutoPicFront, KabutoPicBack

	db TRAILBLAZE, HARDEN, SLASH, ANCIENTPOWER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    BULLDOZE,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     RAGE,         MIMIC,        \
	     ICE_PUNCH,  REFLECT,      ACCELEROCK,         ICE_FANG,         SUBSTITUTE,   \
	     SURF
	; end

	db BANK(KabutoPicFront)
