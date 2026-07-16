	db DEX_KANGASKHAN ; pokedex id

	db 105,  95,  80,  90,  40
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 175 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/kangaskhan.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/kangaskhan.pic", 0, 1 ; sprite dimensions
ENDC
	dw KangaskhanPicFront, KangaskhanPicBack

	db COMET_PUNCH, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AURORA_BEAM,    DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          \
	     FIRE_FANG,      POWER_GEM,      BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       \
		 DRAGON_PULSE,   HYPER_BEAM,     POISON_JAB,     SIGNAL_BEAM,    ENERGY_BALL,    \
		 MIGHTY_CLEAVE,  THUNDERFANG,    EARTHQUAKE,     EARTH_POWER,    DIG,            \
		 ICE_PUNCH,      ACCELEROCK,     THUNDERPUNCH,   FIRE_PUNCH,     SHADOW_CLAW,    \
	     SHADOW_BALL,    DRAGON_CLAW,    ICE_FANG,       THUNDER_WAVE,   AURA_SPHERE,    \
		 THUNDERBOLT,    FLAMETHROWER,   CUT,            SURF,           STRENGTH 
	; end

	db BANK(KangaskhanPicFront)
