	db DEX_CLEFABLE ; pokedex id

	db  95,  70,  73,  60,  85
	;   hp  atk  def  spd  spc

	db FAIRY, FAIRY ; type
	db 25 ; catch rate
	db 129 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/clefable.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/clefable.pic", 0, 1 ; sprite dimensions
ENDC
	dw ClefablePicFront, ClefablePicBack

	db POUND, DEFENSE_CURL, METRONOME, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          POWER_GEM,      BUBBLEBEAM,     \
	     TRAILBLAZE,     ICE_BEAM,       HYPER_BEAM,     ANCIENTPOWER,   SIGNAL_BEAM,    \
	     ENERGY_BALL,    AURA_WHEEL,     EARTH_POWER,    DIG,            PSYCHIC_M,      \
		 PSYBEAM,        ICE_PUNCH,      THUNDERPUNCH,   HEAT_CRASH,     FIRE_PUNCH,     \
	     SHADOW_BALL,    THUNDER_WAVE,   THUNDERBOLT,    FLAMETHROWER,   MOONBLAST,      \
	     STRENGTH,       FLASH 
	; end

	db BANK(ClefablePicFront)
