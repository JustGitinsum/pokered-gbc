	db DEX_MAGMAR ; pokedex id

	db  65,  95,  57,  93,  85
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 167 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/magmar.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/magmar.pic", 0, 1 ; sprite dimensions
ENDC
	dw MagmarPicFront, MagmarPicBack

	db EMBER, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, \
	     RAGE,         PSYCHIC_M,    BRICK_BREAK,     MIMIC,        ICE_PUNCH,  \
	     ACCELEROCK,         METRONOME,    FIRE_BLAST,   FIRE_PUNCH,   ICE_FANG,         \
	     PSYCHO_CUT,      SUBSTITUTE,   STRENGTH
	; end

	db BANK(MagmarPicFront)
