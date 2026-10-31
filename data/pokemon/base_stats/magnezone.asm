	db DEX_MAGNEZONE ; pokedex id

	db  70,  70,  115,  60, 130
	;   hp  atk  def  spd  spc

	db ELECTRIC, STEEL ; type
	db 60 ; catch rate
	db 161 ; base exp

	INCBIN "gfx/pokemon/gsfront/magnezone.pic", 0, 1 ; sprite dimensions
	dw MagnezonePicFront, MagnezonePicBack

	db TACKLE, SUPERSONIC, TRI_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,      TOXIC,          POWER_GEM,      HYPER_BEAM,     SIGNAL_BEAM,    \
	     ENERGY_BALL,    AURA_WHEEL,     FLASH_CANNON,   THUNDER_WAVE,   AURA_SPHERE,    \
	     THUNDERBOLT,    FLY,            FLASH 
	; end

	db BANK(MagnezonePicFront)
