	db DEX_RHYHORN ; pokedex id

	db  80,  85,  95,  25,  30
	;   hp  atk  def  spd  spc

	db GROUND, ROCK ; type
	db 120 ; catch rate
	db 135 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/rhyhorn.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/rhyhorn.pic", 0, 1 ; sprite dimensions
ENDC
	dw RhyhornPicFront, RhyhornPicBack

	db HORN_ATTACK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          FIRE_FANG,      \
	     POWER_GEM,      BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       DRAGON_PULSE,   \
		 POISON_JAB,     ANCIENTPOWER,   MIGHTY_CLEAVE,  THUNDERFANG,    AURA_WHEEL,     \
		 EARTHQUAKE,     EARTH_POWER,    DIG,            GLACIAL_LANCE,  ACCELEROCK,     \
		 HEAT_CRASH,     ICE_FANG,       THUNDER_WAVE,   THUNDERBOLT,    FLAMETHROWER,   \
	     CUT,            STRENGTH 
		  
	; end

	db BANK(RhyhornPicFront)
