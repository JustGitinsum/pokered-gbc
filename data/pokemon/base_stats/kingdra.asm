	db DEX_KINGDRA ; pokedex id

	db  75,  95,  95,  85,  95
	;   hp  atk  def  spd  spc

	db WATER, DRAGON ; type
	db 45 ; catch rate
	db 243 ; base exp

	INCBIN "gfx/pokemon/gsfront/kingdra.pic", 0, 1 ; sprite dimensions
	dw KingdraPicFront, KingdraPicBack

	db BUBBLE, SMOKESCREEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,      AURORA_BEAM,    DRAGONBREATH,   TOXIC,          SLUDGE_BOMB,    \
	     BUBBLEBEAM,     ICE_BEAM,       DRAGON_PULSE,   HYPER_BEAM,     WATERFALL,      \
		 ANCIENTPOWER,   SIGNAL_BEAM,    ENERGY_BALL,    AURA_WHEEL,     DARK_PULSE,     \
		 GLACIAL_LANCE,  ACCELEROCK,     FLASH_CANNON,   THUNDER_WAVE,   THUNDERBOLT,    \
		 SURF 
	; end

	db BANK(KingdraPicFront)
