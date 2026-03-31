	db DEX_GOLEM ; pokedex id

	db  80, 110, 130,  45,  55
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 177 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/golem.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/golem.pic", 0, 1 ; sprite dimensions
ENDC
	dw GolemPicFront, GolemPicBack

	db TACKLE, DEFENSE_CURL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     SLUDGE_BOMB,  HYPER_BEAM,   EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, \
	     RAGE,         EARTHQUAKE,   EARTH_POWER,      DIG,          MIMIC,        \
	     ICE_PUNCH,  ACCELEROCK,         X_SCISSOR,    LEAF_BLADE, FIRE_BLAST,   \
	     ICE_FANG,         AURA_SPHERE,    THUNDERBOLT,   SUBSTITUTE,   STRENGTH
	; end

	db BANK(GolemPicFront)
