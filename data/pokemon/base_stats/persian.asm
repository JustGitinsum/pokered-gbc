	db DEX_PERSIAN ; pokedex id

	db  65,  70,  60, 115,  65
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 148 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/persian.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/persian.pic", 0, 1 ; sprite dimensions
ENDC
	dw PersianPicFront, PersianPicBack

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

	db BANK(PersianPicFront)
