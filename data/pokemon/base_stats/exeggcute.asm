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

	db BULLET_SEED, HYPNOSIS, REFLECT, LEECH_SEED ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    SLUDGE_BOMB,  RAGE,         PSYCHIC_M,    \
	     BRICK_BREAK,     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     LEAF_BLADE, THUNDERPUNCH,     ICE_FANG,         PSYCHO_CUT,      AURA_SPHERE,    \
	     SUBSTITUTE
	; end

	db BANK(ExeggcutePicFront)
