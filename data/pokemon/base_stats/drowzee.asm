	db DEX_DROWZEE ; pokedex id

	db  60,  48,  45,  42,  90
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 102 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/drowzee.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/drowzee.pic", 0, 1 ; sprite dimensions
ENDC
	dw DrowzeePicFront, DrowzeePicBack

	db POUND, HYPNOSIS, DISABLE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     SLUDGE_BOMB,  EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, RAGE,         \
	     PSYCHIC_M,    BRICK_BREAK,     MIMIC,        ICE_PUNCH,  REFLECT,      \
	     ACCELEROCK,         X_SCISSOR,    FIRE_PUNCH,   SHADOW_BALL,  ICE_FANG,         \
	     THUNDER_WAVE, PSYCHO_CUT,      FLAMETHROWER,   SUBSTITUTE,   FLASH
	; end

	db BANK(DrowzeePicFront)
