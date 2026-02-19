	db DEX_RAICHU ; pokedex id

	db  60,  90,  55, 100,  90
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 75 ; catch rate
	db 122 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/raichu.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/raichu.pic", 0, 1 ; sprite dimensions
ENDC
	dw RaichuPicFront, RaichuPicBack

	db THUNDERSHOCK, GROWL, THUNDER_WAVE, QUICK_ATTACK ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   PAY_DAY,      EXTREMESPEED,   SEISMIC_TOSS, \
	     RAGE,         THUNDERFANG,  THUNDER,      MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         SWIFT,        FIRE_PUNCH,   ICE_FANG,         \
	     THUNDER_WAVE, SUBSTITUTE,   FLASH
	; end

	db BANK(RaichuPicFront)
