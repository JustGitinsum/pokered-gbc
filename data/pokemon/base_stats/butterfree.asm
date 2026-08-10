	db DEX_BUTTERFREE ; pokedex id

	db  60,  45,  50,  70,  80
	;   hp  atk  def  spd  spc

	db BUG, FLYING ; type
	db 45 ; catch rate
	db 160 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/butterfree.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/butterfree.pic", 0, 1 ; sprite dimensions
ENDC
	dw ButterfreePicFront, ButterfreePicBack

	db TACKLE, STRING_SHOT, POUNCE, ELECTROWEB ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      AURORA_BEAM,    TOXIC,          ICE_BEAM,       \
	     HYPER_BEAM,     SPORE,          ANCIENTPOWER,   SIGNAL_BEAM,    GIGA_DRAIN,     \
		 ENERGY_BALL,    PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     STEEL_WING,     \
		 SHADOW_BALL,    THUNDER_WAVE,   THUNDERBOLT,    MOONBLAST,      FLY,            \
		 FLASH 
	; end

	db BANK(ButterfreePicFront)
