	db DEX_MAGNETON ; pokedex id

	db  50,  60,  95,  70, 120
	;   hp  atk  def  spd  spc

	db ELECTRIC, STEEL ; type
	db 60 ; catch rate
	db 161 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/magneton.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/magneton.pic", 0, 1 ; sprite dimensions
ENDC
	dw MagnetonPicFront, MagnetonPicBack

	db TACKLE, SUPERSONIC, THUNDERSHOCK, THUNDER_WAVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    SLUDGE_BOMB,  HYPER_BEAM,   RAGE,         \
	     THUNDERFANG,  THUNDER,      BRICK_BREAK,     MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         STEEL_WING,        ICE_FANG,         THUNDER_WAVE, \
	     SUBSTITUTE,   FLASH
	; end

	db BANK(MagnetonPicFront)
