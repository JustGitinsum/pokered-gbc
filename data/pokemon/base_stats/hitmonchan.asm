	db DEX_HITMONCHAN ; pokedex id

	db  50, 105,  79,  76,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 140 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/hitmonchan.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/hitmonchan.pic", 0, 1 ; sprite dimensions
ENDC
	dw HitmonchanPicFront, HitmonchanPicBack

	db DOUBLESLAP, AGILITY, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TOXIC,          TRAILBLAZE,     POISON_JAB,     \
	     MIGHTY_CLEAVE,  EARTHQUAKE,     ICE_PUNCH,      ACCELEROCK,     THUNDERPUNCH,   \
		 FIRE_PUNCH,     AURA_SPHERE,    STRENGTH 
	; end

	db BANK(HitmonchanPicFront)
