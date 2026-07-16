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
	tmhm AERIAL_ACE,     DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          FIRE_FANG,      \
	     POWER_GEM,      DRAGON_PULSE,   HYPER_BEAM,     ANCIENTPOWER,   MIGHTY_CLEAVE,  \
		 THUNDERFANG,    DIG,            ACCELEROCK,     HEAT_CRASH,     FLAMETHROWER,   \
		 STRENGTH 
	; end

	db BANK(ArcaninePicFront)
