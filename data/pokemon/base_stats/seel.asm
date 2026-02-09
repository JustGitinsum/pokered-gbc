	db DEX_SEEL ; pokedex id

	db  65,  45,  55,  45,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 190 ; catch rate
	db 100 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/seel.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/seel.pic", 0, 1 ; sprite dimensions
ENDC
	dw SeelPicFront, SeelPicBack

	db HEADBUTT, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     PAY_DAY,      \
	     RAGE,         MIMIC,        ICE_PUNCH,  ACCELEROCK,         FIRE_PUNCH,   \
	     ICE_FANG,         SUBSTITUTE,   SURF,         STRENGTH
	; end

	db BANK(SeelPicFront)
