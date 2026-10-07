	db DEX_CERULEDGE ; pokedex id

	db  75, 125,  80,  85, 100
	;   hp  atk  def  spd  spc

	db FIRE, GHOST ; type
	db 90 ; catch rate
	db 190 ; base exp

	INCBIN "gfx/pokemon/gsfront/ceruledge.pic", 0, 1 ; sprite dimensions
	dw CeruledgePicFront, CeruledgePicBack

	db EMBER, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

; tm/hm learnset
	tmhm CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      HYPER_BEAM,     POISON_JAB,     \
	     MIGHTY_CLEAVE,  DIG,            ACCELEROCK,     HEAT_CRASH,     FIRE_PUNCH,     \
	     SHADOW_CLAW,    SHADOW_BALL,    DRAGON_CLAW,    PSYCHO_CUT,     CUT,            \
		 STRENGTH,       FLASH
	; end

	db BANK(CeruledgePicFront)
