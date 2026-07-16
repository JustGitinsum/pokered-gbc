	db DEX_GOLDUCK ; pokedex id

	db  80,  82,  78,  85,  80
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 75 ; catch rate
	db 174 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/golduck.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/golduck.pic", 0, 1 ; sprite dimensions
ENDC
	dw GolduckPicFront, GolduckPicBack

	db SCRATCH, TAIL_WHIP, WATER_GUN, CONFUSION ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          POWER_GEM,      \
	     BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       HYPER_BEAM,     POISON_JAB,     \
		 WATERFALL,      SIGNAL_BEAM,    EARTH_POWER,    DIG,            PSYCHIC_M,      \
		 PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      GLACIAL_LANCE,  ACCELEROCK,     \
		 THUNDERPUNCH,   FIRE_PUNCH,     SHADOW_CLAW,    THUNDER_WAVE,   AURA_SPHERE,    \
		 CUT,            SURF,           STRENGTH,       FLASH 
	; end

	db BANK(GolduckPicFront)
