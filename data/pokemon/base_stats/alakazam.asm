	db DEX_ALAKAZAM ; pokedex id

	db  55,  50,  45, 120, 135
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 50 ; catch rate
	db 186 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/alakazam.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/alakazam.pic", 0, 1 ; sprite dimensions
ENDC
	dw AlakazamPicFront, AlakazamPicBack

	db TELEPORT, CONFUSION, DISABLE, PSYBEAM ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,          POWER_GEM,      HYPER_BEAM,     ANCIENTPOWER,   ENERGY_BALL,    \
	     EARTH_POWER,    PSYCHIC_M,      PSYBEAM,        ICE_PUNCH,      THUNDERPUNCH,   \
		 FIRE_PUNCH,     SHADOW_BALL,    THUNDER_WAVE,   PSYCHO_CUT,     AURA_SPHERE,    \
		 FLAMETHROWER,   MOONBLAST,      FLASH 
	; end

	db BANK(AlakazamPicFront)
