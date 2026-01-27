	db DEX_ABRA ; pokedex id

	db  25,  20,  15,  90, 105
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 200 ; catch rate
	db 73 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/abra.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/abra.pic", 0, 1 ; sprite dimensions
ENDC
	dw AbraPicFront, AbraPicBack

	db TELEPORT, SCRATCH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     PSYCHIC_M,    TELEPORT,     MIMIC,        ICE_PUNCH,  REFLECT,      \
	     BIDE,         METRONOME,    FIRE_PUNCH,   REST,         THUNDER_WAVE, \
	     PSYWAVE,      FLAMETHROWER,   SUBSTITUTE,   FLASH
	; end

	db BANK(AbraPicFront)
