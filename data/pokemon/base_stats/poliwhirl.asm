	db DEX_POLIWHIRL ; pokedex id

	db  65,  65,  65,  90,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 120 ; catch rate
	db 131 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/poliwhirl.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/poliwhirl.pic", 0, 1 ; sprite dimensions
ENDC
	dw PoliwhirlPicFront, PoliwhirlPicBack

	db BUBBLE, HYPNOSIS, WATER_GUN, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          BUBBLEBEAM,     TRAILBLAZE,     \
	     ICE_BEAM,       HYPER_BEAM,     POISON_JAB,     WATERFALL,      SIGNAL_BEAM,    \
	     MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    DIG,            PSYCHIC_M,      \
		 PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      AURA_SPHERE,    SURF,           \
		 STRENGTH 
	; end

	db BANK(PoliwhirlPicFront)
