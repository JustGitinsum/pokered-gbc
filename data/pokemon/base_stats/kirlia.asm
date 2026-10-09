	db DEX_KIRLIA ; pokedex id

	db  38,  35,  35, 50, 65
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, FAIRY ; type
	db 120 ; catch rate
	db 97 ; base exp

	INCBIN "gfx/pokemon/gsfront/kirlia.pic", 0, 1 ; sprite dimensions
	dw KirliaPicFront, KirliaPicBack

	db POUND, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	tmhm AIR_SLASH,      AURORA_BEAM,    CLOSE_COMBAT,   POWER_GEM,      TRAILBLAZE,     \
	     ICE_BEAM,       ANCIENTPOWER,   ENERGY_BALL,    EARTH_POWER,    PSYCHIC_M,      \
		 PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      THUNDERPUNCH,   FIRE_PUNCH,     \
		 SHADOW_BALL,    THUNDER_WAVE,   AURA_SPHERE,    THUNDERBOLT,    MOONBLAST,      \
		 FLASH
	; end

	db BANK(KirliaPicFront)
