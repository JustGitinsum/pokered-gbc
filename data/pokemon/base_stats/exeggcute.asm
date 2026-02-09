	db DEX_EXEGGCUTE ; pokedex id

	db  60,  40,  80,  40,  60
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC_TYPE ; type
	db 90 ; catch rate
	db 98 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/exeggcute.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/exeggcute.pic", 0, 1 ; sprite dimensions
ENDC
	dw ExeggcutePicFront, ExeggcutePicBack

	db BARRAGE, HYPNOSIS, REFLECT, LEECH_SEED ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     SELFDESTRUCT, THUNDERPUNCH,     ICE_FANG,         EXTRASENSORY,      EXPLOSION,    \
	     SUBSTITUTE
	; end

	db BANK(ExeggcutePicFront)
