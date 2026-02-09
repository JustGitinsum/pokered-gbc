	db DEX_MACHOP ; pokedex id

	db  70,  80,  50,  35,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 180 ; catch rate
	db 88 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/machop.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/machop.pic", 0, 1 ; sprite dimensions
ENDC
	dw MachopPicFront, MachopPicBack

	db KARATE_CHOP, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   MEGA_KICK,    TOXIC,        FIRE_FANG,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     EARTHQUAKE,   EARTH_POWER,      DIG,          MIMIC,        ICE_PUNCH,  \
	     ACCELEROCK,         METRONOME,    FIRE_BLAST,   FIRE_PUNCH,   ICE_FANG,         \
	     THUNDERBOLT,   SUBSTITUTE,   STRENGTH
	; end

	db BANK(MachopPicFront)
