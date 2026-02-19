	db DEX_PARASECT ; pokedex id

	db  60,  95,  80,  30,  80
	;   hp  atk  def  spd  spc

	db BUG, GRASS ; type
	db 75 ; catch rate
	db 128 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/parasect.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/parasect.pic", 0, 1 ; sprite dimensions
ENDC
	dw ParasectPicFront, ParasectPicBack

	db SCRATCH, STUN_SPORE, LEECH_LIFE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        FIRE_FANG,    BULLDOZE,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         GIGA_DRAIN,   ENERGY_BALL,    DIG,          \
	     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         FIRE_PUNCH,   \
	     ICE_FANG,         SUBSTITUTE,   CUT
	; end

	db BANK(ParasectPicFront)
