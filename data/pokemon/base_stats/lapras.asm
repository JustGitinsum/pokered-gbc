	db DEX_LAPRAS ; pokedex id

	db 130,  85,  80,  60,  95
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db 45 ; catch rate
	db 219 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/lapras.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/lapras.pic", 0, 1 ; sprite dimensions
ENDC
	dw LaprasPicFront, LaprasPicBack

	db TRAILBLAZE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   FIRE_FANG,    BULLDOZE,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     RAGE,         ENERGY_BALL,    DRAGON_RAGE,  THUNDERFANG,  THUNDER,      \
	     PSYCHIC_M,    MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     FIRE_PUNCH,   ICE_FANG,         EXTRASENSORY,      SUBSTITUTE,   SURF,         \
	     STRENGTH
	; end

	db BANK(LaprasPicFront)
