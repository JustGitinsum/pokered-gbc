	db DEX_MACHAMP ; pokedex id

	db  90, 130,  80,  55,  65
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 193 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/machamp.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/machamp.pic", 0, 1 ; sprite dimensions
ENDC
	dw MachampPicFront, MachampPicBack

	db KARATE_CHOP, LOW_SWEEP, LEER, FOCUS_ENERGY ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      TRAILBLAZE,     \
	     HYPER_BEAM,     POISON_JAB,     MIGHTY_CLEAVE,  AURA_WHEEL,     EARTHQUAKE,     \
		 DIG,            ICE_PUNCH,      ACCELEROCK,     THUNDERPUNCH,   HEAT_CRASH,     \
		 FIRE_PUNCH,     AURA_SPHERE,    FLAMETHROWER,   STRENGTH 
	; end

	db BANK(MachampPicFront)
