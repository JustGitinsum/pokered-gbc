	db DEX_RAPIDASH ; pokedex id

	db  65, 100,  70, 105,  80
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 60 ; catch rate
	db 192 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/rapidash.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/rapidash.pic", 0, 1 ; sprite dimensions
ENDC
	dw RapidashPicFront, RapidashPicBack

	db EMBER, TAIL_WHIP, STOMP, GROWL ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   FIRE_FANG,    BULLDOZE,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MIMIC,        ICE_PUNCH,  REFLECT,      \
	     ACCELEROCK,         FIRE_BLAST,   SWIFT,        FIRE_PUNCH,   ICE_FANG,         \
	     SUBSTITUTE
	; end

	db BANK(RapidashPicFront)
