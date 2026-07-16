	db DEX_CLEFAIRY ; pokedex id

	db  70,  45,  48,  35,  60
	;   hp  atk  def  spd  spc

	db FAIRY, FAIRY ; type
	db 150 ; catch rate
	db 68 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/clefairy.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/clefairy.pic", 0, 1 ; sprite dimensions
ENDC
	dw ClefairyPicFront, ClefairyPicBack

	db POUND, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          POWER_GEM,      BUBBLEBEAM,     \
	     TRAILBLAZE,     ICE_BEAM,       HYPER_BEAM,     ANCIENTPOWER,   SIGNAL_BEAM,    \
	     ENERGY_BALL,    AURA_WHEEL,     EARTH_POWER,    DIG,            PSYCHIC_M,      \
		 PSYBEAM,        ICE_PUNCH,      THUNDERPUNCH,   HEAT_CRASH,     FIRE_PUNCH,     \
	     SHADOW_BALL,    THUNDER_WAVE,   THUNDERBOLT,    FLAMETHROWER,   MOONBLAST,      \
	     STRENGTH,       FLASH 
	; end

	db BANK(ClefairyPicFront)
