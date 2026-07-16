	db DEX_MANKEY ; pokedex id

	db  40,  80,  35,  70,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 190 ; catch rate
	db 74 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/mankey.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/mankey.pic", 0, 1 ; sprite dimensions
ENDC
	dw MankeyPicFront, MankeyPicBack

	db SCRATCH, LEER, FOCUS_ENERGY, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TOXIC,          TRAILBLAZE,     HYPER_BEAM,     \
	     POISON_JAB,     MIGHTY_CLEAVE,  AURA_WHEEL,     EARTHQUAKE,     DIG,            \
	     DARK_PULSE,     ICE_PUNCH,      ACCELEROCK,     THUNDERPUNCH,   FIRE_PUNCH,     \
	     SHADOW_CLAW,    THUNDER_WAVE,   AURA_SPHERE,    THUNDERBOLT,    STRENGTH 
	; end

	db BANK(MankeyPicFront)
