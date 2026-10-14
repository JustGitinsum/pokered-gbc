	db DEX_TYRUNT ; pokedex id

	db  58,  89,  77,  48,  45
	;   hp  atk  def  spd  spc

	db ROCK, DRAGON ; type
	db 145 ; catch rate
	db 72 ; base exp

	INCBIN "gfx/pokemon/gsfront/tyrunt.pic", 0, 1 ; sprite dimensions
	dw TyruntPicFront, TyruntPicBack

	db TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

; tm/hm learnset
	tmhm DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          FIRE_FANG,      POWER_GEM,      \
	     TRAILBLAZE,     DRAGON_PULSE,   ANCIENTPOWER,   MIGHTY_CLEAVE,  THUNDERFANG,    \
		 DIG,            DARK_PULSE,     ACCELEROCK,     SHADOW_CLAW,    DRAGON_CLAW,    \
		 ICE_FANG,       STRENGTH
	; end

	db BANK(TyruntPicFront)
