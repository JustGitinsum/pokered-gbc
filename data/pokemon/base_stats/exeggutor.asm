	db DEX_EXEGGUTOR ; pokedex id

	db  95,  95,  85,  55, 125
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 212 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/exeggutor.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/exeggutor.pic", 0, 1 ; sprite dimensions
ENDC
	dw ExeggutorPicFront, ExeggutorPicBack

	db BULLET_SEED, HYPNOSIS, REFLECT, LEECH_SEED ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BULLDOZE,    DOUBLE_EDGE,  HYPER_BEAM,   RAGE,         \
	     GIGA_DRAIN,   ENERGY_BALL,    PSYCHIC_M,    TELEPORT,     MIMIC,        \
	     ICE_PUNCH,  REFLECT,      ACCELEROCK,         SELFDESTRUCT, THUNDERPUNCH,     \
	     ICE_FANG,         EXTRASENSORY,      EXPLOSION,    SUBSTITUTE,   STRENGTH
	; end

	db BANK(ExeggutorPicFront)
