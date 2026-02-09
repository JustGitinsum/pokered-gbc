	db DEX_RHYDON ; pokedex id

	db 105, 130, 120,  40,  45
	;   hp  atk  def  spd  spc

	db GROUND, ROCK ; type
	db 60 ; catch rate
	db 204 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/rhydon.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/rhydon.pic", 0, 1 ; sprite dimensions
ENDC
	dw RhydonPicFront, RhydonPicBack

	db HORN_ATTACK, STOMP, TAIL_WHIP, FURY_ATTACK ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   MEGA_KICK,    TOXIC,        HORN_DRILL,   FIRE_FANG,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   PAY_DAY,      SUBMISSION,   COUNTER,      \
	     SEISMIC_TOSS, RAGE,         THUNDERFANG,  THUNDER,      EARTHQUAKE,   \
	     EARTH_POWER,      DIG,          MIMIC,        ICE_PUNCH,  ACCELEROCK,         \
	     FIRE_BLAST,   FIRE_PUNCH,   ICE_FANG,         THUNDERBOLT,   SUBSTITUTE,   \
	     SURF,         STRENGTH
	; end

	db BANK(RhydonPicFront)
