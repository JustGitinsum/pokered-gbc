	db DEX_HITMONCHAN ; pokedex id

	db  50, 105,  79,  76,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 140 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/hitmonchan.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/hitmonchan.pic", 0, 1 ; sprite dimensions
ENDC
	dw HitmonchanPicFront, HitmonchanPicBack

	db DOUBLESLAP, AGILITY, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   MEGA_KICK,    TOXIC,        FIRE_FANG,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     MIMIC,        ICE_PUNCH,  ACCELEROCK,         METRONOME,    SWIFT,        \
	     FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE,   STRENGTH
	; end

	db BANK(HitmonchanPicFront)
