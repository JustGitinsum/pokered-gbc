	db DEX_GROWLITHE ; pokedex id

	db  55,  70,  45,  60,  50
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 190 ; catch rate
	db 91 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/growlithe.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/growlithe.pic", 0, 1 ; sprite dimensions
ENDC
	dw GrowlithePicFront, GrowlithePicBack

	db BITE, ROAR, EMBER, LEER ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     DRAGON_RAGE,  DIG,          MIMIC,        ICE_PUNCH,  REFLECT,      \
	     ACCELEROCK,         FIRE_BLAST,   SWIFT,        FIRE_PUNCH,   ICE_FANG,         \
	     SUBSTITUTE
	; end

	db BANK(GrowlithePicFront)
