	db DEX_MACHOP ; pokedex id

	db  70,  80,  50,  35,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 180 ; catch rate
	db 88 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/machop.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/machop.pic", 0, 1 ; sprite dimensions
ENDC
	dw MachopPicFront, MachopPicBack

	db KARATE_CHOP, LEER, FOCUS_ENERGY, LOW_SWEEP ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TOXIC,          TRAILBLAZE,     HYPER_BEAM,     \
	     POISON_JAB,     MIGHTY_CLEAVE,  AURA_WHEEL,     EARTHQUAKE,     DIG,            \
		 ICE_PUNCH,      ACCELEROCK,     THUNDERPUNCH,   HEAT_CRASH,     FIRE_PUNCH,     \
		 AURA_SPHERE,    FLAMETHROWER,   STRENGTH 
	; end

	db BANK(MachopPicFront)
