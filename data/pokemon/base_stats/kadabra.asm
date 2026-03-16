	db DEX_KADABRA ; pokedex id

	db  40,  35,  30, 105, 120
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 100 ; catch rate
	db 145 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/kadabra.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/kadabra.pic", 0, 1 ; sprite dimensions
ENDC
	dw KadabraPicFront, KadabraPicBack

	db BRICK_BREAK, CONFUSION, DISABLE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     DOUBLE_EDGE,  EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, RAGE,         \
	     DIG,          PSYCHIC_M,    BRICK_BREAK,     MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         METRONOME,    FIRE_PUNCH,   ICE_FANG,         \
	     THUNDER_WAVE, PSYCHO_CUT,      FLAMETHROWER,   SUBSTITUTE,   FLASH
	; end

	db BANK(KadabraPicFront)
