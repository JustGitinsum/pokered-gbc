	db DEX_MEWTWO ; pokedex id

	db 106, 110,  90, 130, 154
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 3 ; catch rate
	db 220 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/mewtwo.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/mewtwo.pic", 0, 1 ; sprite dimensions
ENDC
	dw MewtwoPicFront, MewtwoPicBack

	db CONFUSION, DISABLE, SWIFT, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          \
	     POWER_GEM,      BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       HYPER_BEAM,     \
	     POISON_JAB,     ANCIENTPOWER,   SIGNAL_BEAM,    ENERGY_BALL,    EARTHQUAKE,     \
		 EARTH_POWER,    PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      \
		 GLACIAL_LANCE,  FLASH_CANNON,   THUNDERPUNCH,   FIRE_PUNCH,     SHADOW_BALL,    \
		 THUNDER_WAVE,   PSYCHO_CUT,     AURA_SPHERE,    THUNDERBOLT,    FLAMETHROWER,   \
		 MOONBLAST,      FLY,            STRENGTH,       FLASH 
	; end

	db BANK(MewtwoPicFront)
