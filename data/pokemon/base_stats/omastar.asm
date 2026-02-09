	db DEX_OMASTAR ; pokedex id

	db  70,  60, 125,  55, 115
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 199 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/omastar.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/omastar.pic", 0, 1 ; sprite dimensions
ENDC
	dw OmastarPicFront, OmastarPicBack

	db TRAILBLAZE, WITHDRAW, HORN_ATTACK, ANCIENTPOWER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     SUBMISSION,   SEISMIC_TOSS, RAGE,         MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE,   \
	     SURF
	; end

	db BANK(OmastarPicFront)
