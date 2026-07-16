	db DEX_MEOWTH ; pokedex id

	db  40,  45,  35,  90,  40
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 69 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/meowth.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/meowth.pic", 0, 1 ; sprite dimensions
ENDC
	dw MeowthPicFront, MeowthPicBack

	db SCRATCH, GROWL, PAY_DAY, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          FIRE_FANG,      \
	     POWER_GEM,      BUBBLEBEAM,     TRAILBLAZE,     HYPER_BEAM,     MIGHTY_CLEAVE,  \
		 THUNDERFANG,    AURA_WHEEL,     EARTH_POWER,    DIG,            DARK_PULSE,     \
		 ACCELEROCK,     SHADOW_CLAW,    SHADOW_BALL,    DRAGON_CLAW,    ICE_FANG,       \
		 THUNDER_WAVE,   PSYCHO_CUT,     THUNDERBOLT,    FLAMETHROWER,   MOONBLAST,      \
	     CUT,            FLASH 
	; end

	db BANK(MeowthPicFront)
