	db DEX_SLOWBRO ; pokedex id

	db  95,  75, 110,  30,  80
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db 75 ; catch rate
	db 164 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/slowbro.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/slowbro.pic", 0, 1 ; sprite dimensions
ENDC
	dw SlowbroPicFront, SlowbroPicBack

	db TACKLE, GROWL, TAIL_WHIP, ANCIENTPOWER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     SLUDGE_BOMB,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SIGNAL_BEAM,      EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, \
	     RAGE,         EARTHQUAKE,   EARTH_POWER,      DIG,          PSYCHIC_M,    \
	     BRICK_BREAK,     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     FIRE_BLAST,   STEEL_WING,        FIRE_PUNCH,   ICE_FANG,         THUNDER_WAVE, \
	     PSYCHO_CUT,      FLAMETHROWER,   SUBSTITUTE,   SURF,         STRENGTH,     \
	     FLASH
	; end

	db BANK(SlowbroPicFront)
