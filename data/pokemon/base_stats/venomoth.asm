	db DEX_VENOMOTH ; pokedex id

	db  70,  65,  60,  90,  90
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 75 ; catch rate
	db 138 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/venomoth.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/venomoth.pic", 0, 1 ; sprite dimensions
ENDC
	dw VenomothPicFront, VenomothPicBack

	db TACKLE, DISABLE, POISONPOWDER, LEECH_LIFE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,   WHIRLWIND,    TOXIC,        BULLDOZE,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         GIGA_DRAIN,   ENERGY_BALL,    PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     SWIFT,        ICE_FANG,         EXTRASENSORY,      SUBSTITUTE
	; end

	db BANK(VenomothPicFront)
