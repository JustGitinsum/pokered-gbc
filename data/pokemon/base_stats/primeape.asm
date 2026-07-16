	db DEX_PRIMEAPE ; pokedex id

	db  65, 105,  60,  95,  60
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 75 ; catch rate
	db 149 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/primeape.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/primeape.pic", 0, 1 ; sprite dimensions
ENDC
	dw PrimeapePicFront, PrimeapePicBack

	db SCRATCH, LEER, KARATE_CHOP, FURY_SWIPES ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TOXIC,          TRAILBLAZE,     HYPER_BEAM,     \
	     POISON_JAB,     MIGHTY_CLEAVE,  AURA_WHEEL,     EARTHQUAKE,     DIG,            \
	     DARK_PULSE,     ICE_PUNCH,      ACCELEROCK,     THUNDERPUNCH,   FIRE_PUNCH,     \
	     SHADOW_CLAW,    THUNDER_WAVE,   AURA_SPHERE,    THUNDERBOLT,    STRENGTH 
	; end

	db BANK(PrimeapePicFront)
