	db DEX_DIGLETT ; pokedex id

	db  10,  55,  25,  95,  45
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 255 ; catch rate
	db 81 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/diglett.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/diglett.pic", 0, 1 ; sprite dimensions
ENDC
	dw DiglettPicFront, DiglettPicBack

	db SCRATCH, SAND_ATTACK, GROWL, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TOXIC,          SLUDGE_BOMB,    TRAILBLAZE,     \
	     HYPER_BEAM,     MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    DIG,            \
		 ACCELEROCK,     FLASH_CANNON,   SHADOW_CLAW,    CUT 
	; end

	db BANK(DiglettPicFront)
