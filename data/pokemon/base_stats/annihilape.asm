	db DEX_ANNIHILAPE ; pokedex id

	db  110,  115, 80, 90, 90
	;   hp  atk  def  spd  spc

	db GHOST, FIGHTING ; type
	db 45 ; catch rate
	db 230 ; base exp

	INCBIN "gfx/pokemon/gsfront/annihilape.pic", 0, 1 ; sprite dimensions
	dw AnnihilapePicFront, AnnihilapePicBack

	db SCRATCH, LEER, KARATE_CHOP, FURY_SWIPES ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TOXIC,          TRAILBLAZE,     HYPER_BEAM,     \
	     POISON_JAB,     MIGHTY_CLEAVE,  AURA_WHEEL,     EARTHQUAKE,     DIG,            \
	     DARK_PULSE,     ICE_PUNCH,      ACCELEROCK,     THUNDERPUNCH,   FIRE_PUNCH,     \
	     SHADOW_CLAW,    THUNDER_WAVE,   AURA_SPHERE,    THUNDERBOLT,    STRENGTH 
	; end

	db BANK(AnnihilapePicFront)
