	db DEX_NIDORINA ; pokedex id

	db  70,  62,  67,  56,  55
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 120 ; catch rate
	db 117 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/nidorina.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/nidorina.pic", 0, 1 ; sprite dimensions
ENDC
	dw NidorinaPicFront, NidorinaPicBack

	db GROWL, TACKLE, SCRATCH, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   FIRE_FANG,    BULLDOZE,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     RAGE,         \
	     THUNDERFANG,  THUNDER,      MIMIC,        ICE_PUNCH,  REFLECT,      \
	     ACCELEROCK,         FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE
	; end

	db BANK(NidorinaPicFront)
