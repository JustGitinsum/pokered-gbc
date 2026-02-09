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

	db CONFUSION, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     PAY_DAY,      RAGE,         \
	     EARTHQUAKE,   EARTH_POWER,      DIG,          PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         FIRE_BLAST,   \
	     SWIFT,        FIRE_PUNCH,   ICE_FANG,         THUNDER_WAVE, EXTRASENSORY,      \
	     FLAMETHROWER,   SUBSTITUTE,   SURF,         STRENGTH,     FLASH
	; end

	db BANK(SlowpokePicFront)
