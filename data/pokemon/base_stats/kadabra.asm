	db DEX_KADABRA ; pokedex id

	db  40,  35,  30, 105, 120
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 100 ; catch rate
	db 145 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/kadabra.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/kadabra.pic", 0, 1 ; sprite dimensions
ENDC
	dw KadabraPicFront, KadabraPicBack

	db TELEPORT, CONFUSION, DISABLE, PSYBEAM ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,          POWER_GEM,      HYPER_BEAM,     ANCIENTPOWER,   ENERGY_BALL,    \
	     EARTH_POWER,    PSYCHIC_M,      PSYBEAM,        ICE_PUNCH,      THUNDERPUNCH,   \
		 FIRE_PUNCH,     SHADOW_BALL,    THUNDER_WAVE,   PSYCHO_CUT,     AURA_SPHERE,    \
		 FLAMETHROWER,   MOONBLAST,      FLASH 
	; end

	db BANK(KadabraPicFront)
