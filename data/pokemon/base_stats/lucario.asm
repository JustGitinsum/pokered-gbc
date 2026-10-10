	db DEX_LUCARIO ; pokedex id

	db  70, 110,  70,  90,  115
	;   hp  atk  def  spd  spc

	db FIGHTING, STEEL ; type
	db 115 ; catch rate
	db 184 ; base exp

	INCBIN "gfx/pokemon/gsfront/Lucario.pic", 0, 1 ; sprite dimensions
	dw LucarioPicFront, LucarioPicBack

	db QUICK_ATTACK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TRAILBLAZE,     DRAGON_PULSE,   HYPER_BEAM,     \
	     POISON_JAB,     MIGHTY_CLEAVE,  AURA_WHEEL,     EARTHQUAKE,     EARTH_POWER,    \
		 DIG,            PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      \
		 GLACIAL_LANCE,  ACCELEROCK,     FLASH_CANNON,   THUNDERPUNCH,   HEAT_CRASH,     \
		 FIRE_PUNCH,     SHADOW_CLAW,    SHADOW_BALL,    AURA_SPHERE,    CUT,            \
		 STRENGTH
	; end

	db BANK(LucarioPicFront)
