	db DEX_SEEL ; pokedex id

	db  65,  45,  55,  45,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 190 ; catch rate
	db 100 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/seel.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/seel.pic", 0, 1 ; sprite dimensions
ENDC
	dw SeelPicFront, SeelPicBack

	db HEADBUTT, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    TOXIC,          POWER_GEM,      BUBBLEBEAM,     ICE_BEAM,       \
	     HYPER_BEAM,     WATERFALL,      SIGNAL_BEAM,    GLACIAL_LANCE,  ACCELEROCK,     \
		 MOONBLAST,      SURF,           STRENGTH 
	; end

	db BANK(SeelPicFront)
