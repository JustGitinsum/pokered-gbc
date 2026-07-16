	db DEX_SEAKING ; pokedex id

	db  80,  92,  65,  68,  80
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 60 ; catch rate
	db 170 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/seaking.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/seaking.pic", 0, 1 ; sprite dimensions
ENDC
	dw SeakingPicFront, SeakingPicBack

	db PECK, TAIL_WHIP, SUPERSONIC, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    TOXIC,          BUBBLEBEAM,     ICE_BEAM,       HYPER_BEAM,     \
	     POISON_JAB,     WATERFALL,      SIGNAL_BEAM,    PSYBEAM,        GLACIAL_LANCE,  \
		 SURF 
	; end

	db BANK(SeakingPicFront)
