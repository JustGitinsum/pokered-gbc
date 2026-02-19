	db DEX_KANGASKHAN ; pokedex id

	db 105,  95,  80,  90,  40
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 175 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/kangaskhan.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/kangaskhan.pic", 0, 1 ; sprite dimensions
ENDC
	dw KangaskhanPicFront, KangaskhanPicBack

	db DOUBLESLAP, RAGE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     THUNDERFANG,  THUNDER,      EARTHQUAKE,   EARTH_POWER,      MIMIC,        \
	     ICE_PUNCH,  ACCELEROCK,         FIRE_BLAST,   FIRE_PUNCH,   ICE_FANG,         \
	     THUNDERBOLT,   SUBSTITUTE,   SURF,         STRENGTH
	; end

	db BANK(KangaskhanPicFront)
