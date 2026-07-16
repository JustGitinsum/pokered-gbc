	db DEX_DROWZEE ; pokedex id

	db  60,  48,  45,  42,  90
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 102 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/drowzee.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/drowzee.pic", 0, 1 ; sprite dimensions
ENDC
	dw DrowzeePicFront, DrowzeePicBack

	db POUND, HYPNOSIS, DISABLE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CLOSE_COMBAT,   TOXIC,          POWER_GEM,      SLUDGE_BOMB,    TRAILBLAZE,     \
	     HYPER_BEAM,     POISON_JAB,     ANCIENTPOWER,   SIGNAL_BEAM,    AURA_WHEEL,     \
	     EARTH_POWER,    PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      \
		 FLASH_CANNON,   THUNDERPUNCH,   FIRE_PUNCH,     SHADOW_BALL,    THUNDER_WAVE,   \
	     AURA_SPHERE,    STRENGTH,       FLASH 
	; end

	db BANK(DrowzeePicFront)
