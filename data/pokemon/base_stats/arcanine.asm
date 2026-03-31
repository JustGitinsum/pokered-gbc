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
	tmhm TOXIC,        FIRE_FANG,    BODY_SLAM,    SLUDGE_BOMB,  HYPER_BEAM,   \
	     RAGE,         DRAGON_RAGE,  DIG,          BRICK_BREAK,     MIMIC,        \
	     ICE_PUNCH,  REFLECT,      ACCELEROCK,         FIRE_BLAST,   STEEL_WING,        \
	     FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE
	; end

	db BANK(ArcaninePicFront)
