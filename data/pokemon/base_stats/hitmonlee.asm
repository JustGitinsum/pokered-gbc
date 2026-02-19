	db DEX_HITMONLEE ; pokedex id

	db  50, 120,  53,  87,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 139 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/hitmonlee.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/hitmonlee.pic", 0, 1 ; sprite dimensions
ENDC
	dw HitmonleePicFront, HitmonleePicBack

	db DOUBLE_KICK, MEDITATE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     MIMIC,        ICE_PUNCH,  ACCELEROCK,         METRONOME,    SWIFT,        \
	     FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE,   STRENGTH
	; end

	db BANK(HitmonleePicFront)
