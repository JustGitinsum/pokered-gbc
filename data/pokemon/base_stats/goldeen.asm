	db DEX_GOLDEEN ; pokedex id

	db  45,  67,  60,  63,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 111 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/goldeen.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/goldeen.pic", 0, 1 ; sprite dimensions
ENDC
	dw GoldeenPicFront, GoldeenPicBack

	db PECK, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        PLAY_ROUGH,   BODY_SLAM,    SLUDGE_BOMB,  BUBBLEBEAM,   \
	     TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     RAGE,         MIMIC,        \
	     ICE_PUNCH,  ACCELEROCK,         STEEL_WING,        FIRE_PUNCH,   ICE_FANG,         \
	     SUBSTITUTE,   SURF
	; end

	db BANK(GoldeenPicFront)
