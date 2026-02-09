	db DEX_HAUNTER ; pokedex id

	db  45,  50,  45,  95, 115
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 90 ; catch rate
	db 126 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/haunter.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/haunter.pic", 0, 1 ; sprite dimensions
ENDC
	dw HaunterPicFront, HaunterPicBack

	db LICK, CONFUSE_RAY, OMINOUS_WIND, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        RAGE,         GIGA_DRAIN,   THUNDERFANG,  THUNDER,      \
	     PSYCHIC_M,    MIMIC,        ICE_PUNCH,  ACCELEROCK,         SELFDESTRUCT, \
	     DREAM_EATER,  ICE_FANG,         EXTRASENSORY,      EXPLOSION,    SUBSTITUTE
	; end

	db BANK(HaunterPicFront)
