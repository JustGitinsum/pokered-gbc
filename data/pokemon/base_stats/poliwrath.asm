	db DEX_POLIWRATH ; pokedex id

	db  90,  85,  95,  70,  70
	;   hp  atk  def  spd  spc

	db WATER, FIGHTING ; type
	db 45 ; catch rate
	db 185 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/poliwrath.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/poliwrath.pic", 0, 1 ; sprite dimensions
ENDC
	dw PoliwrathPicFront, PoliwrathPicBack

	db HYPNOSIS, TRAILBLAZE, DOUBLESLAP, BODY_SLAM ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          BUBBLEBEAM,     TRAILBLAZE,     \
	     ICE_BEAM,       HYPER_BEAM,     POISON_JAB,     WATERFALL,      SIGNAL_BEAM,    \
	     MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    DIG,            PSYCHIC_M,      \
		 PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      AURA_SPHERE,    SURF,           \
		 STRENGTH 
	; end

	db BANK(PoliwrathPicFront)
