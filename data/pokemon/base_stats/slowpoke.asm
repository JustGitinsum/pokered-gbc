	db DEX_SLOWPOKE ; pokedex id

	db  90,  65,  65,  15,  40
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 99 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/slowpoke.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/slowpoke.pic", 0, 1 ; sprite dimensions
ENDC
	dw SlowpokePicFront, SlowpokePicBack

	db TACKLE, GROWL, TAIL_WHIP, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    BODY_SLAM,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     SIGNAL_BEAM,      RAGE,         \
	     EARTHQUAKE,   EARTH_POWER,      DIG,          PSYCHIC_M,    BRICK_BREAK,     \
	     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         FIRE_BLAST,   \
	     STEEL_WING,        FIRE_PUNCH,   ICE_FANG,         THUNDER_WAVE, PSYCHO_CUT,      \
	     FLAMETHROWER,   SUBSTITUTE,   SURF,         STRENGTH,     FLASH
	; end

	db BANK(SlowpokePicFront)
