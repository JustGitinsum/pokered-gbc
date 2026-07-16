	db DEX_WEEZING ; pokedex id

	db  65,  90, 120,  60,  85
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 60 ; catch rate
	db 173 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/weezing.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/weezing.pic", 0, 1 ; sprite dimensions
ENDC
	dw WeezingPicFront, WeezingPicBack

	db TACKLE, SMOG, SLUDGE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,      TOXIC,          SLUDGE_BOMB,    HYPER_BEAM,     SIGNAL_BEAM,    \
	     ENERGY_BALL,    AURA_WHEEL,     PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     \
		 ACCELEROCK,     HEAT_CRASH,     SHADOW_BALL,    THUNDER_WAVE,   THUNDERBOLT,    \
		 FLAMETHROWER,   MOONBLAST,      FLASH 
	; end

	db BANK(WeezingPicFront)
