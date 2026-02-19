	db DEX_MACHOKE ; pokedex id

	db  80, 100,  70,  45,  50
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 90 ; catch rate
	db 146 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/machoke.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/machoke.pic", 0, 1 ; sprite dimensions
ENDC
	dw MachokePicFront, MachokePicBack

	db KARATE_CHOP, LOW_SWEEP, LEER, FOCUS_ENERGY ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     EARTHQUAKE,   EARTH_POWER,      DIG,          MIMIC,        ICE_PUNCH,  \
	     ACCELEROCK,         METRONOME,    FIRE_BLAST,   FIRE_PUNCH,   ICE_FANG,         \
	     THUNDERBOLT,   SUBSTITUTE,   STRENGTH
	; end

	db BANK(MachokePicFront)
