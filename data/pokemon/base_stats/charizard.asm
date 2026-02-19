	db DEX_CHARIZARD ; pokedex id

	db  78,  84,  78, 100,  85
	;   hp  atk  def  spd  spc

	db FIRE, FLYING ; type
	db 45 ; catch rate
	db 209 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/charizard.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/charizard.pic", 0, 1 ; sprite dimensions
ENDC
	dw CharizardPicFront, CharizardPicBack

	db SCRATCH, GROWL, EMBER, LEER ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   SWORDS_DANCE, CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    \
	     BULLDOZE,    DOUBLE_EDGE,  HYPER_BEAM,   EXTREMESPEED,   COUNTER,      \
	     SEISMIC_TOSS, RAGE,         DRAGON_RAGE,  EARTHQUAKE,   EARTH_POWER,      \
	     DIG,          MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     FIRE_BLAST,   SWIFT,        FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE,   \
	     CUT,          STRENGTH
	; end

	db BANK(CharizardPicFront)
