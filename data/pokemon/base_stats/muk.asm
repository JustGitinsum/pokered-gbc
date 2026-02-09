	db DEX_MUK ; pokedex id

	db 105, 105,  75,  50,  65
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 75 ; catch rate
	db 157 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/muk.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/muk.pic", 0, 1 ; sprite dimensions
ENDC
	dw MukPicFront, MukPicBack

	db POUND, DISABLE, POISON_GAS, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    HYPER_BEAM,   RAGE,         GIGA_DRAIN,   \
	     THUNDERFANG,  THUNDER,      MIMIC,        ICE_PUNCH,  ACCELEROCK,         \
	     SELFDESTRUCT, FIRE_BLAST,   ICE_FANG,         EXPLOSION,    SUBSTITUTE
	; end

	db BANK(MukPicFront)
