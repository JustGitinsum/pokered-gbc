	db DEX_GRIMER ; pokedex id

	db  80,  80,  50,  25,  40
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 190 ; catch rate
	db 90 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/grimer.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/grimer.pic", 0, 1 ; sprite dimensions
ENDC
	dw GrimerPicFront, GrimerPicBack

	db POUND, DISABLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    RAGE,         GIGA_DRAIN,   THUNDERFANG,  \
	     THUNDER,      MIMIC,        ICE_PUNCH,  ACCELEROCK,         SELFDESTRUCT, \
	     FIRE_BLAST,   ICE_FANG,         EXPLOSION,    SUBSTITUTE
	; end

	db BANK(GrimerPicFront)
