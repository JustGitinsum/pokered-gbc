	db DEX_JYNX ; pokedex id

	db  65,  50,  35,  95,  95
	;   hp  atk  def  spd  spc

	db ICE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 137 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/jynx.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/jynx.pic", 0, 1 ; sprite dimensions
ENDC
	dw JynxPicFront, JynxPicBack

	db POUND, LICK, LOVELY_KISS, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    TOXIC,          POWER_GEM,      BUBBLEBEAM,     ICE_BEAM,       \
	     HYPER_BEAM,     ANCIENTPOWER,   SIGNAL_BEAM,    ENERGY_BALL,    PSYCHIC_M,      \
		 PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      GLACIAL_LANCE,  ACCELEROCK,     \
		 FLASH_CANNON,   SHADOW_BALL,    THUNDER_WAVE,   PSYCHO_CUT,     MOONBLAST,      \
	     STRENGTH,       FLASH 
	; end

	db BANK(JynxPicFront)
