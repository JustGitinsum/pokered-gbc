	db DEX_MACHAMP ; pokedex id

	db  90, 130,  80,  55,  65
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 193 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/machamp.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/machamp.pic", 0, 1 ; sprite dimensions
ENDC
	dw MachampPicFront, MachampPicBack

	db KARATE_CHOP, LOW_SWEEP, LEER, FOCUS_ENERGY ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         EARTHQUAKE,   EARTH_POWER,      DIG,          MIMIC,        \
	     ICE_PUNCH,  ACCELEROCK,         METRONOME,    FIRE_BLAST,   FIRE_PUNCH,   \
	     ICE_FANG,         THUNDERBOLT,   SUBSTITUTE,   STRENGTH
	; end

	db BANK(MachampPicFront)
