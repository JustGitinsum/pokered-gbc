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

	db CONFUSION, GUST, STRING_SHOT, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,   WHIRLWIND,    TOXIC,        BULLDOZE,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         GIGA_DRAIN,   ENERGY_BALL,    PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     SWIFT,        ICE_FANG,         EXTRASENSORY,      SUBSTITUTE
	; end

	db BANK(ButterfreePicFront)
