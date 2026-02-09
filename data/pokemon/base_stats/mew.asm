	db DEX_MEW ; pokedex id

	db 100, 100, 100, 100, 100
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 64 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/mew.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/mew.pic", 0, 1 ; sprite dimensions
ENDC
	dw MewPicFront, MewPicBack

	db POUND, AMNESIA, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   AIR_SLASH,   SWORDS_DANCE, WHIRLWIND,    MEGA_KICK,    \
	     TOXIC,        HORN_DRILL,   FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     PAY_DAY,      SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     GIGA_DRAIN,   ENERGY_BALL,    DRAGON_RAGE,  THUNDERFANG,  THUNDER,      \
	     EARTHQUAKE,   EARTH_POWER,      DIG,          PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         METRONOME,    \
	     SELFDESTRUCT, THUNDERPUNCH,     FIRE_BLAST,   SWIFT,        FIRE_PUNCH,   \
	     SOFTBOILED,   DREAM_EATER,  SKY_ATTACK,   ICE_FANG,         THUNDER_WAVE, \
	     EXTRASENSORY,      EXPLOSION,    THUNDERBOLT,   FLAMETHROWER,   SUBSTITUTE,   \
	     CUT,          FLY,          SURF,         STRENGTH,     FLASH,        \
	     UNUSED
	; end

	db BANK(MewPicFront)
