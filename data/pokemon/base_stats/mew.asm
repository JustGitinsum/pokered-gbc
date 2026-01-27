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
	tmhm MEGA_PUNCH,   RAZOR_WIND,   SWORDS_DANCE, WHIRLWIND,    MEGA_KICK,    \
	     TOXIC,        HORN_DRILL,   BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     PAY_DAY,      SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     GIGA_DRAIN,   SOLARBEAM,    DRAGON_RAGE,  THUNDERBOLT,  THUNDER,      \
	     EARTHQUAKE,   FISSURE,      DIG,          PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        ICE_PUNCH,  REFLECT,      BIDE,         METRONOME,    \
	     SELFDESTRUCT, THUNDERPUNCH,     FIRE_BLAST,   SWIFT,        FIRE_PUNCH,   \
	     SOFTBOILED,   DREAM_EATER,  SKY_ATTACK,   REST,         THUNDER_WAVE, \
	     PSYWAVE,      EXPLOSION,    ROCK_SLIDE,   FLAMETHROWER,   SUBSTITUTE,   \
	     CUT,          FLY,          SURF,         STRENGTH,     FLASH,        \
	     UNUSED
	; end

	db BANK(MewPicFront)
