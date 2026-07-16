	db DEX_WIGGLYTUFF ; pokedex id

	db 140,  70,  45,  45,  50
	;   hp  atk  def  spd  spc

	db NORMAL, FAIRY ; type
	db 50 ; catch rate
	db 109 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/wigglytuff.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/wigglytuff.pic", 0, 1 ; sprite dimensions
ENDC
	dw WigglytuffPicFront, WigglytuffPicBack

	db SING, DISABLE, DEFENSE_CURL, DOUBLESLAP ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          BUBBLEBEAM,     TRAILBLAZE,     \
	     ICE_BEAM,       DRAGON_PULSE,   HYPER_BEAM,     ENERGY_BALL,    AURA_WHEEL,     \
	     EARTH_POWER,    DIG,            PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     \
		 ICE_PUNCH,      ACCELEROCK,     THUNDERPUNCH,   FIRE_PUNCH,     SHADOW_BALL,    \
		 THUNDER_WAVE,   AURA_SPHERE,    THUNDERBOLT,    FLAMETHROWER,   MOONBLAST,      \
	     STRENGTH,       FLASH 
	; end

	db BANK(WigglytuffPicFront)
