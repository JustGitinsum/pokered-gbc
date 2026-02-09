	db DEX_VENONAT ; pokedex id

	db  60,  55,  50,  45,  40
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 190 ; catch rate
	db 75 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/venonat.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/venonat.pic", 0, 1 ; sprite dimensions
ENDC
	dw VenonatPicFront, VenonatPicBack

	db TACKLE, DISABLE, SUPERSONIC, CONFUSION ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         GIGA_DRAIN,   \
	     ENERGY_BALL,    PSYCHIC_M,    MIMIC,        ICE_PUNCH,  REFLECT,      \
	     ACCELEROCK,         ICE_FANG,         EXTRASENSORY,      SUBSTITUTE
	; end

	db BANK(VenonatPicFront)
