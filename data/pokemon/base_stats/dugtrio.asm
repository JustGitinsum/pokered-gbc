	db DEX_DUGTRIO ; pokedex id

	db  35,  100,  50, 120,  50,  70
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db 50 ; catch rate
	db 153 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/dugtrio.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/dugtrio.pic", 0, 1 ; sprite dimensions
ENDC
	dw DugtrioPicFront, DugtrioPicBack

	db SCRATCH, GROWL, SAND_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TOXIC,          SLUDGE_BOMB,    TRAILBLAZE,     \
	     HYPER_BEAM,     MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    DIG,            \
		 ACCELEROCK,     FLASH_CANNON,   SHADOW_CLAW,    CUT 
	; end

	db BANK(DugtrioPicFront)
