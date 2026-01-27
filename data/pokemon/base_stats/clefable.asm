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
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     SOLARBEAM,    THUNDERBOLT,  THUNDER,      PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        ICE_PUNCH,  REFLECT,      BIDE,         METRONOME,    \
	     FIRE_BLAST,   FIRE_PUNCH,   REST,         THUNDER_WAVE, PSYWAVE,      \
	     FLAMETHROWER,   SUBSTITUTE,   STRENGTH,     FLASH
	; end

	db BANK(ClefablePicFront)
