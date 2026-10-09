	db DEX_GARDEVOIR ; pokedex id

	db  68,  65,  65, 80, 125
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, FAIRY ; type
	db 50 ; catch rate
	db 230 ; base exp

	INCBIN "gfx/pokemon/gsfront/gardevoir.pic", 0, 1 ; sprite dimensions
	dw GardevoirPicFront, GardevoirPicBack

	db HYPER_VOICE, POUND, LEER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

; tm/hm learnset
	tmhm AIR_SLASH,      AURORA_BEAM,    CLOSE_COMBAT,   POWER_GEM,      TRAILBLAZE,     \
	     ICE_BEAM,       HYPER_BEAM,     ANCIENTPOWER,   ENERGY_BALL,    EARTH_POWER,    \
		 PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      THUNDERPUNCH,   \
		 FIRE_PUNCH,     SHADOW_BALL,    THUNDER_WAVE,   AURA_SPHERE,    THUNDERBOLT,    \
		 MOONBLAST,      FLASH
	; end
	db BANK(GardevoirPicFront)
