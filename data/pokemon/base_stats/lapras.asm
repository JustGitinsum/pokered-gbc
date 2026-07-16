	db DEX_LAPRAS ; pokedex id

	db 130,  85,  80,  60,  95
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db 45 ; catch rate
	db 219 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/lapras.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/lapras.pic", 0, 1 ; sprite dimensions
ENDC
	dw LaprasPicFront, LaprasPicBack

	db WATER_GUN, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    DRAGONBREATH,   TOXIC,          POWER_GEM,      BUBBLEBEAM,     \
	     ICE_BEAM,       DRAGON_PULSE,   HYPER_BEAM,     WATERFALL,      ANCIENTPOWER,   \
		 AURA_WHEEL,     EARTHQUAKE,     EARTH_POWER,    PSYCHIC_M,      PSYBEAM,        \
	     DARK_PULSE,     GLACIAL_LANCE,  ACCELEROCK,     FLASH_CANNON,   THUNDER_WAVE,   \
	     THUNDERBOLT,    MOONBLAST,      SURF,           STRENGTH,       FLASH 
	; end

	db BANK(LaprasPicFront)
