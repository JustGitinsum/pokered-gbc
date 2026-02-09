	db DEX_MAGNEMITE ; pokedex id

	db  25,  35,  70,  45,  95
	;   hp  atk  def  spd  spc

	db ELECTRIC, STEEL ; type
	db 190 ; catch rate
	db 89 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/magnemite.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/magnemite.pic", 0, 1 ; sprite dimensions
ENDC
	dw MagnemitePicFront, MagnemitePicBack

	db TACKLE, SUPERSONIC, THUNDERSHOCK, THUNDER_WAVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         THUNDERFANG,  \
	     THUNDER,      TELEPORT,     MIMIC,        ICE_PUNCH,  REFLECT,      \
	     ACCELEROCK,         SWIFT,        ICE_FANG,         THUNDER_WAVE, SUBSTITUTE,   \
	     FLASH
	; end

	db BANK(MagnemitePicFront)
