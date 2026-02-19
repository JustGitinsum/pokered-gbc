	db DEX_CHARMANDER ; pokedex id

	db  39,  52,  43,  65,  50
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 65 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/charmander.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/charmander.pic", 0, 1 ; sprite dimensions
ENDC
	dw CharmanderPicFront, CharmanderPicBack

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   SWORDS_DANCE, CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    \
	     BULLDOZE,    DOUBLE_EDGE,  EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         DRAGON_RAGE,  DIG,          MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         FIRE_BLAST,   SWIFT,        FIRE_PUNCH,   \
	     ICE_FANG,         SUBSTITUTE,   CUT,          STRENGTH
	; end

	db BANK(CharmanderPicFront)
