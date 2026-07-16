	db DEX_RHYDON ; pokedex id

	db 105, 130, 120,  40,  45
	;   hp  atk  def  spd  spc

	db GROUND, ROCK ; type
	db 60 ; catch rate
	db 204 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/rhydon.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/rhydon.pic", 0, 1 ; sprite dimensions
ENDC
	dw RhydonPicFront, RhydonPicBack

	db HORN_ATTACK, STOMP, TAIL_WHIP, FURY_ATTACK ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          FIRE_FANG,      \
	     POWER_GEM,      BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       DRAGON_PULSE,   \
		 HYPER_BEAM,     POISON_JAB,     ANCIENTPOWER,   MIGHTY_CLEAVE,  THUNDERFANG,    \
		 AURA_WHEEL,     EARTHQUAKE,     EARTH_POWER,    DIG,            ICE_PUNCH,      \
		 GLACIAL_LANCE,  ACCELEROCK,     THUNDERPUNCH,   HEAT_CRASH,     FIRE_PUNCH,     \
	     SHADOW_CLAW,    DRAGON_CLAW,    ICE_FANG,       THUNDER_WAVE,   THUNDERBOLT,    \
		 FLAMETHROWER,   CUT,            SURF,           STRENGTH 
	; end

	db BANK(RhydonPicFront)
