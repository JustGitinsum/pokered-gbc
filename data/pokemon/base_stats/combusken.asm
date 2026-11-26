	db DEX_COMBUSKEN ; pokedex id

	db  60,  85,  60,  55,  85,  60
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIGHTING ; type
	db 90 ; catch rate
	db 142 ; base exp

	INCBIN "gfx/pokemon/gsfront/combusken.pic", 0, 1 ; sprite dimensions
	dw CombuskenPicFront, CombuskenPicBack

	db PECK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          \
	     TRAILBLAZE,     POISON_JAB,     DIG,            ACCELEROCK,     \
		 THUNDERPUNCH,   HEAT_CRASH,     STEEL_WING,     FIRE_PUNCH,     \
		 SHADOW_CLAW,    AURA_SPHERE,    FLAMETHROWER,   CUT,            \
		 STRENGTH,       FLASH
	; end

	db BANK(CombuskenPicFront)
