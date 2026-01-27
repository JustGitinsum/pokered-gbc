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
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     SOLARBEAM,    THUNDERBOLT,  THUNDER,      PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        ICE_PUNCH,  REFLECT,      BIDE,         FIRE_BLAST,   \
	     FIRE_PUNCH,   REST,         THUNDER_WAVE, PSYWAVE,      FLAMETHROWER,   \
	     SUBSTITUTE,   STRENGTH,     FLASH
	; end

	db BANK(WigglytuffPicFront)
