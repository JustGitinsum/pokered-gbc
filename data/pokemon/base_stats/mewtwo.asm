	db DEX_MEWTWO ; pokedex id

	db 106, 110,  90, 130, 154
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 3 ; catch rate
	db 220 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/mewtwo.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/mewtwo.pic", 0, 1 ; sprite dimensions
ENDC
	dw MewtwoPicFront, MewtwoPicBack

	db CONFUSION, DISABLE, SWIFT, ANCIENTPOWER ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   PAY_DAY,      SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         SOLARBEAM,    THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        ICE_PUNCH,  REFLECT,      BIDE,         \
	     METRONOME,    SELFDESTRUCT, FIRE_BLAST,   FIRE_PUNCH,   REST,         \
	     THUNDER_WAVE, PSYWAVE,      FLAMETHROWER,   SUBSTITUTE,   STRENGTH,     \
	     FLASH
	; end

	db BANK(MewtwoPicFront)
