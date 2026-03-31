	db DEX_SANDSLASH ; pokedex id

	db  75, 100, 110,  65,  55
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 90 ; catch rate
	db 163 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/sandslash.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/sandslash.pic", 0, 1 ; sprite dimensions
ENDC
	dw SandslashPicFront, SandslashPicBack

	db SCRATCH, SAND_ATTACK, LUNGE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        FIRE_FANG,    BODY_SLAM,    SLUDGE_BOMB,  \
	     HYPER_BEAM,   EXTREMESPEED,   SEISMIC_TOSS, RAGE,         EARTHQUAKE,   \
	     EARTH_POWER,      DIG,          MIMIC,        ICE_PUNCH,  ACCELEROCK,         \
	     STEEL_WING,        FIRE_PUNCH,   ICE_FANG,         THUNDERBOLT,   SUBSTITUTE,   \
	     CUT,          STRENGTH
	; end

	db BANK(SandslashPicFront)
