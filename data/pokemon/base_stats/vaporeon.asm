	db DEX_VAPOREON ; pokedex id

	db 130,  65,  60,  65, 110
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 196 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/vaporeon.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/vaporeon.pic", 0, 1 ; sprite dimensions
ENDC
	dw VaporeonPicFront, VaporeonPicBack

	db TACKLE, SAND_ATTACK, QUICK_ATTACK, TRAILBLAZE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         \
	     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         SWIFT,        \
	     FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE,   SURF
	; end

	db BANK(VaporeonPicFront)
