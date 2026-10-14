	db DEX_TYRANTRUM ; pokedex id

	db  82, 121, 119, 71, 69
	;   hp  atk  def  spd  spc

	db ROCK, DRAGON ; type
	db 45 ; catch rate
	db 182 ; base exp

	INCBIN "gfx/pokemon/gsfront/tyrantrum.pic", 0, 1 ; sprite dimensions
	dw TyrantrumPicFront, TyrantrumPicBack

	db TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

; tm/hm learnset
	tmhm DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          FIRE_FANG,      POWER_GEM,      \
	     TRAILBLAZE,     DRAGON_PULSE,   HYPER_BEAM,     ANCIENTPOWER,   MIGHTY_CLEAVE,  \
		 THUNDERFANG,    AURA_WHEEL,     EARTHQUAKE,     EARTH_POWER,    DIG,            \
	     DARK_PULSE,     ACCELEROCK,     HEAT_CRASH,     SHADOW_CLAW,    DRAGON_CLAW,    \
		 ICE_FANG,       STRENGTH
	; end

	db BANK(TyrantrumPicFront)
