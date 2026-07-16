	db DEX_GASTLY ; pokedex id

	db  30,  35,  30,  80, 100
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 190 ; catch rate
	db 95 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/gastly.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/gastly.pic", 0, 1 ; sprite dimensions
ENDC
	dw GastlyPicFront, GastlyPicBack

	db LICK, CONFUSE_RAY, OMINOUS_WIND, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    TOXIC,          SLUDGE_BOMB,    ICE_BEAM,       HYPER_BEAM,     \
	     SIGNAL_BEAM,    GIGA_DRAIN,     ENERGY_BALL,    PSYCHIC_M,      PSYBEAM,        \
		 DARK_PULSE,     SHADOW_CLAW,    SHADOW_BALL,    THUNDER_WAVE,   THUNDERBOLT,    \
		 MOONBLAST,      FLASH 
	; end

	db BANK(GastlyPicFront)
