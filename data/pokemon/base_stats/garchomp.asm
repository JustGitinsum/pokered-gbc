	db DEX_GARCHOMP ; pokedex id

	db  108, 130,  95, 102, 85
	;   hp  atk  def  spd  spc

	db DRAGON, GROUND ; type
	db 45 ; catch rate
	db 218 ; base exp

	INCBIN "gfx/pokemon/gsfront/garchomp.pic", 0, 1 ; sprite dimensions
	dw GarchompPicFront, GarchompPicBack

	db TACKLE, SAND_ATTACK, CRUNCH, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      \
	     FIRE_FANG,      BUBBLEBEAM,     TRAILBLAZE,     DRAGON_PULSE,   HYPER_BEAM,     \
	     POISON_JAB,     WATERFALL,      MIGHTY_CLEAVE,  THUNDERFANG,    EARTHQUAKE,     \
		 EARTH_POWER,    DIG,            ACCELEROCK,     SHADOW_CLAW,    DRAGON_CLAW,    \
		 FLAMETHROWER,   CUT,            SURF,           STRENGTH
	; end

	db BANK(GarchompPicFront)
