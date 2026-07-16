	db DEX_STARMIE ; pokedex id

	db  60,  75,  85, 115, 100
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db 60 ; catch rate
	db 207 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/starmie.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/starmie.pic", 0, 1 ; sprite dimensions
ENDC
	dw StarmiePicFront, StarmiePicBack

	db TACKLE, WATER_GUN, HARDEN, CONFUSE_RAY ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,      AURORA_BEAM,    TOXIC,          POWER_GEM,      BUBBLEBEAM,     \
	     ICE_BEAM,       HYPER_BEAM,     WATERFALL,      ANCIENTPOWER,   AURA_WHEEL,     \
	     PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     GLACIAL_LANCE,  ACCELEROCK,     \
		 FLASH_CANNON,   THUNDER_WAVE,   PSYCHO_CUT,     THUNDERBOLT,    CUT,            \
		 SURF,           FLASH 
	; end

	db BANK(StarmiePicFront)
