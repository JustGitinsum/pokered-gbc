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

	db POUND, REFLECT, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   AIR_SLASH,   SWORDS_DANCE, THIEF,    CLOSE_COMBAT,    \
	     TOXIC,        PLAY_ROUGH,   FIRE_FANG,    BODY_SLAM,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     SIGNAL_BEAM,      EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, RAGE,         \
	     GIGA_DRAIN,   ENERGY_BALL,    DRAGON_RAGE,  THUNDERFANG,  THUNDER,      \
	     EARTHQUAKE,   EARTH_POWER,      DIG,          PSYCHIC_M,    BRICK_BREAK,     \
	     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         METRONOME,    \
	     LEAF_BLADE, THUNDERPUNCH,     FIRE_BLAST,   STEEL_WING,        FIRE_PUNCH,   \
	     SOFTBOILED,   SHADOW_BALL,  DRAGON_CLAW,   ICE_FANG,         THUNDER_WAVE, \
	     PSYCHO_CUT,      AURA_SPHERE,    THUNDERBOLT,   FLAMETHROWER,   SUBSTITUTE,   \
	     CUT,          FLY,          SURF,         STRENGTH,     FLASH,        \
	     UNUSED
	; end

	db BANK(MewPicFront)
