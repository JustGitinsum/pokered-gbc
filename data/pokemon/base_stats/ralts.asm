	db DEX_RALTS ; pokedex id

	db  28,  25,  25,  40, 45
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, FAIRY ; type
	db 235 ; catch rate
	db 40 ; base exp

	INCBIN "gfx/pokemon/gsfront/ralts.pic", 0, 1 ; sprite dimensions
	dw RaltsPicFront, RaltsPicBack

	db POUND, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,      AURORA_BEAM,    CLOSE_COMBAT,   POWER_GEM,      TRAILBLAZE,     \
	     ICE_BEAM,       ANCIENTPOWER,   ENERGY_BALL,    EARTH_POWER,    PSYCHIC_M,      \
		 PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      THUNDERPUNCH,   FIRE_PUNCH,     \
		 SHADOW_BALL,    THUNDER_WAVE,   AURA_SPHERE,    THUNDERBOLT,    MOONBLAST,      \
		 FLASH
	; end

	db BANK(RaltsPicFront)
