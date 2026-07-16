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
	tmhm AERIAL_ACE,     AIR_SLASH,      TOXIC,          SLUDGE_BOMB,    TRAILBLAZE,     \
	     HYPER_BEAM,     SPORE,          SIGNAL_BEAM,    GIGA_DRAIN,     ENERGY_BALL,    \
	     PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     FLY,            FLASH 
	; end

	db BANK(VenomothPicFront)
