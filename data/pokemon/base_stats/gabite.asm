	db DEX_GABITE ; pokedex id

	db  68, 90,  65,  82,  55
	;   hp  atk  def  spd  spc

	db DRAGON, GROUND ; type
	db 90 ; catch rate
	db 144 ; base exp

	INCBIN "gfx/pokemon/gsfront/gabite.pic", 0, 1 ; sprite dimensions
	dw GabitePicFront, GabitePicBack

	db TACKLE, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          FIRE_FANG,      \
	     TRAILBLAZE,     DRAGON_PULSE,   POISON_JAB,     MIGHTY_CLEAVE,  THUNDERFANG,    \
		 EARTHQUAKE,     EARTH_POWER,    DIG,            ACCELEROCK,     SHADOW_CLAW,    \
		 DRAGON_CLAW,    FLAMETHROWER,   CUT,            STRENGTH
	; end

	db BANK(GabitePicFront)
