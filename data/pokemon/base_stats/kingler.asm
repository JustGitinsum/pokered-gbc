	db DEX_KINGLER ; pokedex id

	db  55, 130, 115,  75,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 60 ; catch rate
	db 206 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/kingler.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/kingler.pic", 0, 1 ; sprite dimensions
ENDC
	dw KinglerPicFront, KinglerPicBack

	db WATER_GUN, LEER, VICEGRIP, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      BUBBLEBEAM,     \
	     ICE_BEAM,       HYPER_BEAM,     WATERFALL,      MIGHTY_CLEAVE,  EARTHQUAKE,     \
		 DIG,            GLACIAL_LANCE,  ACCELEROCK,     SHADOW_CLAW,    DRAGON_CLAW,    \
		 PSYCHO_CUT,     CUT,            SURF,           STRENGTH 
	; end

	db BANK(KinglerPicFront)
