	db DEX_RIOLU ; pokedex id

	db  40, 70,  40,  60,  40
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 215 ; catch rate
	db 57 ; base exp

	INCBIN "gfx/pokemon/gsfront/Riolu.pic", 0, 1 ; sprite dimensions
	dw RioluPicFront, RioluPicBack

	db QUICK_ATTACK, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TRAILBLAZE,     DRAGON_PULSE,   HYPER_BEAM,     \
	     POISON_JAB,     MIGHTY_CLEAVE,  AURA_WHEEL,     EARTHQUAKE,     EARTH_POWER,    \
		 DIG,            PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      \
		 GLACIAL_LANCE,  ACCELEROCK,     FLASH_CANNON,   THUNDERPUNCH,   HEAT_CRASH,     \
		 FIRE_PUNCH,     SHADOW_CLAW,    SHADOW_BALL,    AURA_SPHERE,    CUT,            \
		 STRENGTH
	; end

	db BANK(RioluPicFront)
