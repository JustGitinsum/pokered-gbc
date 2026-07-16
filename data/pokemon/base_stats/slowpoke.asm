	db DEX_SLOWPOKE ; pokedex id

	db  90,  65,  65,  15,  40
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 99 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/slowpoke.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/slowpoke.pic", 0, 1 ; sprite dimensions
ENDC
	dw SlowpokePicFront, SlowpokePicBack

	db TACKLE, GROWL, TAIL_WHIP, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          BUBBLEBEAM,     \
	     TRAILBLAZE,     ICE_BEAM,       POISON_JAB,     WATERFALL,      SIGNAL_BEAM,    \
		 EARTHQUAKE,     EARTH_POWER,    DIG,            PSYCHIC_M,      PSYBEAM,        \
		 DARK_PULSE,     SHADOW_BALL,    THUNDER_WAVE,   FLAMETHROWER,   SURF,           \
		 STRENGTH,       FLASH 
	; end

	db BANK(SlowpokePicFront)
