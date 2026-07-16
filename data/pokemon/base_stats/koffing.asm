	db DEX_KOFFING ; pokedex id

	db  40,  65,  95,  35,  60
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 190 ; catch rate
	db 114 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/koffing.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/koffing.pic", 0, 1 ; sprite dimensions
ENDC
	dw KoffingPicFront, KoffingPicBack

	db TACKLE, SMOG, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,      TOXIC,          SLUDGE_BOMB,    HYPER_BEAM,     SIGNAL_BEAM,    \
	     ENERGY_BALL,    AURA_WHEEL,     PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     \
		 ACCELEROCK,     HEAT_CRASH,     SHADOW_BALL,    THUNDER_WAVE,   THUNDERBOLT,    \
		 FLAMETHROWER,   MOONBLAST,      FLASH 
	; end

	db BANK(KoffingPicFront)
