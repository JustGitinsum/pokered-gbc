	db DEX_CHARMELEON ; pokedex id

	db  58,  64,  58,  80,  65
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 142 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/charmeleon.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/charmeleon.pic", 0, 1 ; sprite dimensions
ENDC
	dw CharmeleonPicFront, CharmeleonPicBack

	db SCRATCH, GROWL, EMBER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   SWORDS_DANCE, CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    \
	     BODY_SLAM,    SLUDGE_BOMB,  EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, \
	     RAGE,         DRAGON_RAGE,  DIG,          MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         FIRE_BLAST,   STEEL_WING,        FIRE_PUNCH,   \
	     ICE_FANG,         SUBSTITUTE,   CUT,          STRENGTH
	; end

	db BANK(CharmeleonPicFront)
