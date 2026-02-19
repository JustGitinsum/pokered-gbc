	db DEX_CLEFABLE ; pokedex id

	db  95,  70,  73,  60,  85
	;   hp  atk  def  spd  spc

	db FAIRY, FAIRY ; type
	db 25 ; catch rate
	db 129 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/clefable.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/clefable.pic", 0, 1 ; sprite dimensions
ENDC
	dw ClefablePicFront, ClefablePicBack

	db SING, DOUBLESLAP, MINIMIZE, METRONOME ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     ENERGY_BALL,    THUNDERFANG,  THUNDER,      PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         METRONOME,    \
	     FIRE_BLAST,   FIRE_PUNCH,   ICE_FANG,         THUNDER_WAVE, EXTRASENSORY,      \
	     FLAMETHROWER,   SUBSTITUTE,   STRENGTH,     FLASH
	; end

	db BANK(ClefablePicFront)
