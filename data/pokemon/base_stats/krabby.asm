	db DEX_KRABBY ; pokedex id

	db  30, 105,  90,  50,  25
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 115 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/krabby.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/krabby.pic", 0, 1 ; sprite dimensions
ENDC
	dw KrabbyPicFront, KrabbyPicBack

	db WATER_GUN, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      BUBBLEBEAM,     \
	     ICE_BEAM,       HYPER_BEAM,     WATERFALL,      MIGHTY_CLEAVE,  EARTHQUAKE,     \
		 DIG,            GLACIAL_LANCE,  ACCELEROCK,     SHADOW_CLAW,    DRAGON_CLAW,    \
		 PSYCHO_CUT,     CUT,            SURF,           STRENGTH 
	; end

	db BANK(KrabbyPicFront)
