	db DEX_MAGNETON ; pokedex id

	db  50,  60,  95,  70, 120
	;   hp  atk  def  spd  spc

	db ELECTRIC, STEEL ; type
	db 60 ; catch rate
	db 161 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/magneton.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/magneton.pic", 0, 1 ; sprite dimensions
ENDC
	dw MagnetonPicFront, MagnetonPicBack

	db TACKLE, SUPERSONIC, THUNDERSHOCK, THUNDER_WAVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,      TOXIC,          POWER_GEM,      HYPER_BEAM,     SIGNAL_BEAM,    \
	     ENERGY_BALL,    AURA_WHEEL,     FLASH_CANNON,   THUNDER_WAVE,   AURA_SPHERE,    \
	     THUNDERBOLT,    FLY,            FLASH 
	; end

	db BANK(MagnetonPicFront)
