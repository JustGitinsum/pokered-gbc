	db DEX_ARCANINE ; pokedex id

	db  90, 110,  80,  95,  80
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 75 ; catch rate
	db 213 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/arcanine.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/arcanine.pic", 0, 1 ; sprite dimensions
ENDC
	dw ArcaninePicFront, ArcaninePicBack

	db BITE, ROAR, EMBER, LEER ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         DRAGON_RAGE,  DIG,          TELEPORT,     MIMIC,        \
	     ICE_PUNCH,  REFLECT,      ACCELEROCK,         FIRE_BLAST,   SWIFT,        \
	     FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE
	; end

	db BANK(ArcaninePicFront)
