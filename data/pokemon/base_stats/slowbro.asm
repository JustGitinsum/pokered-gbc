	db DEX_SLOWBRO ; pokedex id

	db  95,  75, 110,  30,  80
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db 75 ; catch rate
	db 164 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/slowbro.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/slowbro.pic", 0, 1 ; sprite dimensions
ENDC
	dw SlowbroPicFront, SlowbroPicBack

	db TACKLE, GROWL, TAIL_WHIP, ANCIENTPOWER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          POWER_GEM,      \
	     BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       HYPER_BEAM,     POISON_JAB,     \
		 WATERFALL,      ANCIENTPOWER,   SIGNAL_BEAM,    EARTHQUAKE,     EARTH_POWER,    \
		 DIG,            PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      \
		 GLACIAL_LANCE,  SHADOW_BALL,    THUNDER_WAVE,   FLAMETHROWER,   SURF,           \
		 STRENGTH,       FLASH 
	; end

	db BANK(SlowbroPicFront)
