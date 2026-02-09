	db DEX_JOLTEON ; pokedex id

	db  65,  65,  60, 130, 110
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 197 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/jolteon.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/jolteon.pic", 0, 1 ; sprite dimensions
ENDC
	dw JolteonPicFront, JolteonPicBack

	db TACKLE, SAND_ATTACK, QUICK_ATTACK, THUNDERSHOCK ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         THUNDERFANG,  THUNDER,      MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         SWIFT,        FIRE_PUNCH,   ICE_FANG,         \
	     THUNDER_WAVE, SUBSTITUTE,   FLASH
	; end

	db BANK(JolteonPicFront)
