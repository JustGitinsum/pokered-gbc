	db DEX_SANDSHREW ; pokedex id

	db  50,  75,  85,  40,  30
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 255 ; catch rate
	db 93 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/sandshrew.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/sandshrew.pic", 0, 1 ; sprite dimensions
ENDC
	dw SandshrewPicFront, SandshrewPicBack

	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     SUBMISSION,   SEISMIC_TOSS, RAGE,         EARTHQUAKE,   EARTH_POWER,      \
	     DIG,          MIMIC,        ICE_PUNCH,  ACCELEROCK,         SWIFT,        \
	     FIRE_PUNCH,   ICE_FANG,         THUNDERBOLT,   SUBSTITUTE,   CUT,          \
	     STRENGTH
	; end

	db BANK(SandshrewPicFront)
