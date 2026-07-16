	db DEX_SEADRA ; pokedex id

	db  55,  65,  95,  85,  95
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 75 ; catch rate
	db 155 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/seadra.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/seadra.pic", 0, 1 ; sprite dimensions
ENDC
	dw SeadraPicFront, SeadraPicBack

	db BUBBLE, SMOKESCREEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,      AURORA_BEAM,    DRAGONBREATH,   TOXIC,          SLUDGE_BOMB,    \
	     BUBBLEBEAM,     ICE_BEAM,       DRAGON_PULSE,   HYPER_BEAM,     WATERFALL,      \
		 ANCIENTPOWER,   SIGNAL_BEAM,    ENERGY_BALL,    AURA_WHEEL,     DARK_PULSE,     \
		 GLACIAL_LANCE,  ACCELEROCK,     FLASH_CANNON,   THUNDER_WAVE,   THUNDERBOLT,    \
		 SURF 
	; end

	db BANK(SeadraPicFront)
