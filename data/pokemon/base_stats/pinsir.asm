	db DEX_PINSIR ; pokedex id

	db  65, 125, 100,  85,  55
	;   hp  atk  def  spd  spc

	db BUG, BUG ; type
	db 45 ; catch rate
	db 200 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/pinsir.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/pinsir.pic", 0, 1 ; sprite dimensions
ENDC
	dw PinsirPicFront, PinsirPicBack

	db VICEGRIP, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      TRAILBLAZE,     \
	     HYPER_BEAM,     POISON_JAB,     SIGNAL_BEAM,    GIGA_DRAIN,     EARTHQUAKE,     \
		 DIG,            ICE_PUNCH,      THUNDERPUNCH,   FIRE_PUNCH,     SHADOW_CLAW,    \
		 PSYCHO_CUT,     CUT,            STRENGTH,        
	; end

	db BANK(PinsirPicFront)
