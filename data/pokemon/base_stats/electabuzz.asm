	db DEX_ELECTABUZZ ; pokedex id

	db  65,  83,  57, 105,  85
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 156 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/electabuzz.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/electabuzz.pic", 0, 1 ; sprite dimensions
ENDC
	dw ElectabuzzPicFront, ElectabuzzPicBack

	db QUICK_ATTACK, LEER, THUNDERSHOCK, STEEL_WING ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     SLUDGE_BOMB,  HYPER_BEAM,   EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, \
	     RAGE,         THUNDERFANG,  THUNDER,      PSYCHIC_M,    BRICK_BREAK,     \
	     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         X_SCISSOR,    \
	     STEEL_WING,        FIRE_PUNCH,   ICE_FANG,         THUNDER_WAVE, PSYCHO_CUT,      \
	     SUBSTITUTE,   STRENGTH,     FLASH
	; end

	db BANK(ElectabuzzPicFront)
