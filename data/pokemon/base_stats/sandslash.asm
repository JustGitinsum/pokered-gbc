	db DEX_SANDSLASH ; pokedex id

	db  75, 100, 110,  65,  55
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 90 ; catch rate
	db 163 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/sandslash.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/sandslash.pic", 0, 1 ; sprite dimensions
ENDC
	dw SandslashPicFront, SandslashPicBack

	db SCRATCH, SAND_ATTACK, LUNGE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      \
	     TRAILBLAZE,     HYPER_BEAM,     POISON_JAB,     SIGNAL_BEAM,    MIGHTY_CLEAVE,  \
		 EARTHQUAKE,     EARTH_POWER,    DIG,            ACCELEROCK,     LEAF_BLADE,     \
		 SHADOW_CLAW,    DRAGON_CLAW,    PSYCHO_CUT,     CUT,            STRENGTH 
	; end

	db BANK(SandslashPicFront)
