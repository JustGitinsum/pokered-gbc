	db DEX_PRIMEAPE ; pokedex id

	db  65, 105,  60,  95,  60
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 75 ; catch rate
	db 149 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/primeape.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/primeape.pic", 0, 1 ; sprite dimensions
ENDC
	dw PrimeapePicFront, PrimeapePicBack

	db SCRATCH, LEER, KARATE_CHOP, FURY_SWIPES ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   MEGA_KICK,    TOXIC,        FIRE_FANG,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   PAY_DAY,      SUBMISSION,   COUNTER,      \
	     SEISMIC_TOSS, RAGE,         THUNDERFANG,  THUNDER,      DIG,          \
	     MIMIC,        ICE_PUNCH,  ACCELEROCK,         METRONOME,    SWIFT,        \
	     FIRE_PUNCH,   ICE_FANG,         THUNDERBOLT,   SUBSTITUTE,   STRENGTH
	; end

	db BANK(PrimeapePicFront)
