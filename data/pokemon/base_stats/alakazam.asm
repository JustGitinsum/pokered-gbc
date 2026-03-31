	db DEX_ALAKAZAM ; pokedex id

	db  55,  50,  45, 120, 135
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 50 ; catch rate
	db 186 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/alakazam.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/alakazam.pic", 0, 1 ; sprite dimensions
ENDC
	dw AlakazamPicFront, AlakazamPicBack

	db BRICK_BREAK, CONFUSION, DISABLE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     SLUDGE_BOMB,  HYPER_BEAM,   EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, \
	     RAGE,         DIG,          PSYCHIC_M,    BRICK_BREAK,     MIMIC,        \
	     ICE_PUNCH,  REFLECT,      ACCELEROCK,         X_SCISSOR,    FIRE_PUNCH,   \
	     ICE_FANG,         THUNDER_WAVE, PSYCHO_CUT,      FLAMETHROWER,   SUBSTITUTE,   \
	     FLASH
	; end

	db BANK(AlakazamPicFront)
