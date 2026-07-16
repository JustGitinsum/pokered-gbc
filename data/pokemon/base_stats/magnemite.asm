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
	tmhm AIR_SLASH,      TOXIC,          POWER_GEM,      HYPER_BEAM,     SIGNAL_BEAM,    \
	     ENERGY_BALL,    AURA_WHEEL,     FLASH_CANNON,   THUNDER_WAVE,   AURA_SPHERE,    \
	     THUNDERBOLT,    FLY,            FLASH 
	; end

	db BANK(MagnemitePicFront)
