	db DEX_NIDORAN_M ; pokedex id

	db  46,  57,  40,  50,  40
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 235 ; catch rate
	db 60 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/nidoranm.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/nidoranm.pic", 0, 1 ; sprite dimensions
ENDC
	dw NidoranMPicFront, NidoranMPicBack

	db LEER, TACKLE, POISON_STING, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     BLIZZARD,     RAGE,         THUNDERFANG,  THUNDER,      MIMIC,        \
	     ICE_PUNCH,  REFLECT,      ACCELEROCK,         FIRE_PUNCH,   ICE_FANG,         \
	     SUBSTITUTE
	; end

	db BANK(NidoranMPicFront)
