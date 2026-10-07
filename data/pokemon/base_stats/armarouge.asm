	db DEX_ARMAROUGE ; pokedex id

	db  85,  60, 100,  75, 125
	;   hp  atk  def  spd  spc

	db FIRE, PSYCHIC_TYPE ; type
	db 90 ; catch rate
	db 186 ; base exp

	INCBIN "gfx/pokemon/gsfront/armarouge.pic", 0, 1 ; sprite dimensions
	dw ArmarougePicFront, ArmarougePicBack

	db EMBER, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

; tm/hm learnset
	tmhm TOXIC,          POWER_GEM,      SLUDGE_BOMB,    DRAGON_PULSE,   HYPER_BEAM,     \
	     POISON_JAB,     ANCIENTPOWER,   ENERGY_BALL,    EARTH_POWER,    DIG,            \
		 PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     FLASH_CANNON,   HEAT_CRASH,     \
		 FIRE_PUNCH,     SHADOW_BALL,    THUNDER_WAVE,   AURA_SPHERE,    FLAMETHROWER,   \
		 MOONBLAST,      STRENGTH,       FLASH
	; end

	db BANK(ArmarougePicFront)
