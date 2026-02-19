	db DEX_WIGGLYTUFF ; pokedex id

	db 140,  70,  45,  45,  50
	;   hp  atk  def  spd  spc

	db NORMAL, FAIRY ; type
	db 50 ; catch rate
	db 109 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/wigglytuff.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/wigglytuff.pic", 0, 1 ; sprite dimensions
ENDC
	dw WigglytuffPicFront, WigglytuffPicBack

	db SING, DISABLE, DEFENSE_CURL, DOUBLESLAP ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     ENERGY_BALL,    THUNDERFANG,  THUNDER,      PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         FIRE_BLAST,   \
	     FIRE_PUNCH,   ICE_FANG,         THUNDER_WAVE, EXTRASENSORY,      FLAMETHROWER,   \
	     SUBSTITUTE,   STRENGTH,     FLASH
	; end

	db BANK(WigglytuffPicFront)
