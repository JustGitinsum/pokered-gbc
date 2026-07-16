	db DEX_OMANYTE ; pokedex id

	db  35,  40, 100,  35,  90
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 120 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/omanyte.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/omanyte.pic", 0, 1 ; sprite dimensions
ENDC
	dw OmanytePicFront, OmanytePicBack

	db WATER_GUN, WITHDRAW, CONSTRICT, ANCIENTPOWER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    TOXIC,          POWER_GEM,      BUBBLEBEAM,     ICE_BEAM,       \
	     HYPER_BEAM,     WATERFALL,      ANCIENTPOWER,   SIGNAL_BEAM,    MIGHTY_CLEAVE,  \
		 EARTH_POWER,    GLACIAL_LANCE,  ACCELEROCK,     FLASH_CANNON,   THUNDER_WAVE,   \
	     THUNDERBOLT,    SURF,           STRENGTH 
	; end

	db BANK(OmanytePicFront)
