	db DEX_VOLTORB ; pokedex id

	db  40,  30,  50, 100,  55
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 103 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/voltorb.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/voltorb.pic", 0, 1 ; sprite dimensions
ENDC
	dw VoltorbPicFront, VoltorbPicBack

	db TACKLE, LIGHT_SCREEN, SONICBOOM, THUNDERSHOCK ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,          TRAILBLAZE,     HYPER_BEAM,     SIGNAL_BEAM,    AURA_WHEEL,     \
	     FLASH_CANNON,   THUNDER_WAVE,   THUNDERBOLT,    FLASH 
	; end

	db BANK(VoltorbPicFront)
