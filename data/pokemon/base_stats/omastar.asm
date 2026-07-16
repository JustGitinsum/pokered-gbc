	db DEX_OMASTAR ; pokedex id

	db  70,  60, 125,  55, 115
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 199 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/omastar.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/omastar.pic", 0, 1 ; sprite dimensions
ENDC
	dw OmastarPicFront, OmastarPicBack

	db WATER_GUN, WITHDRAW, HORN_ATTACK, ANCIENTPOWER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    TOXIC,          POWER_GEM,      BUBBLEBEAM,     ICE_BEAM,       \
	     HYPER_BEAM,     WATERFALL,      ANCIENTPOWER,   SIGNAL_BEAM,    MIGHTY_CLEAVE,  \
		 EARTH_POWER,    GLACIAL_LANCE,  ACCELEROCK,     FLASH_CANNON,   THUNDER_WAVE,   \
	     THUNDERBOLT,    SURF,           STRENGTH 
	; end

	db BANK(OmastarPicFront)
