	db DEX_ODDISH ; pokedex id

	db  45,  50,  55,  30,  75
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 255 ; catch rate
	db 78 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/oddish.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/oddish.pic", 0, 1 ; sprite dimensions
ENDC
	dw OddishPicFront, OddishPicBack

	db MEGA_DRAIN, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BULLDOZE,    DOUBLE_EDGE,  RAGE,         \
	     GIGA_DRAIN,   ENERGY_BALL,    MIMIC,        ICE_PUNCH,  REFLECT,      \
	     ACCELEROCK,         ICE_FANG,         SUBSTITUTE,   CUT
	; end

	db BANK(OddishPicFront)
