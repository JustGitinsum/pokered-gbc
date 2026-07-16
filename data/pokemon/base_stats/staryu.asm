	db DEX_STARYU ; pokedex id

	db  30,  45,  55,  85,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 106 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/staryu.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/staryu.pic", 0, 1 ; sprite dimensions
ENDC
	dw StaryuPicFront, StaryuPicBack

	db TACKLE, HARDEN, WATER_GUN, CONFUSE_RAY ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,      AURORA_BEAM,    TOXIC,          POWER_GEM,      BUBBLEBEAM,     \
	     ICE_BEAM,       HYPER_BEAM,     WATERFALL,      ANCIENTPOWER,   AURA_WHEEL,     \
	     PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     GLACIAL_LANCE,  ACCELEROCK,     \
		 FLASH_CANNON,   THUNDER_WAVE,   PSYCHO_CUT,     THUNDERBOLT,    CUT,            \
		 SURF,           FLASH 
	; end

	db BANK(StaryuPicFront)
