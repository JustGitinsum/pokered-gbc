	db DEX_GENGAR ; pokedex id

	db  60,  65,  60, 110, 130
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 45 ; catch rate
	db 190 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/gengar.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/gengar.pic", 0, 1 ; sprite dimensions
ENDC
	dw GengarPicFront, GengarPicBack

	db LICK, CONFUSE_RAY, OMINOUS_WIND, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    TOXIC,          SLUDGE_BOMB,    ICE_BEAM,       HYPER_BEAM,     \
	     POISON_JAB,     SIGNAL_BEAM,    GIGA_DRAIN,     ENERGY_BALL,    PSYCHIC_M,      \
		 PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      THUNDERPUNCH,   FIRE_PUNCH,     \
	     SHADOW_CLAW,    SHADOW_BALL,    THUNDER_WAVE,   AURA_SPHERE,    THUNDERBOLT,    \
		 MOONBLAST,      STRENGTH,       FLASH 
	; end

	db BANK(GengarPicFront)
