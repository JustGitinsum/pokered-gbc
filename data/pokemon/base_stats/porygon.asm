	db DEX_PORYGON ; pokedex id

	db  65,  60,  70,  40,  75
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 130 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/porygon.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/porygon.pic", 0, 1 ; sprite dimensions
ENDC
	dw PorygonPicFront, PorygonPicBack

	db TACKLE, SHARPEN, CONVERSION, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AURORA_BEAM,    TOXIC,          ICE_BEAM,       HYPER_BEAM,     \
	     SIGNAL_BEAM,    ENERGY_BALL,    PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     \
		 FLASH_CANNON,   SHADOW_BALL,    THUNDER_WAVE,   THUNDERBOLT,    MOONBLAST,      \
	     FLASH 
	; end

	db BANK(PorygonPicFront)
