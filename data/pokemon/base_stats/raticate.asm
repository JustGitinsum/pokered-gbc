	db DEX_RATICATE ; pokedex id

	db  55,  81,  60,  97,  50
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 116 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/raticate.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/raticate.pic", 0, 1 ; sprite dimensions
ENDC
	dw RaticatePicFront, RaticatePicBack

	db TACKLE, TAIL_WHIP, QUICK_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          FIRE_FANG,      \
	     SLUDGE_BOMB,    BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       HYPER_BEAM,     \
	     POISON_JAB,     MIGHTY_CLEAVE,  THUNDERFANG,    AURA_WHEEL,     DIG,            \
		 DARK_PULSE,     ACCELEROCK,     SHADOW_CLAW,    SHADOW_BALL,    DRAGON_CLAW,    \
		 ICE_FANG,       THUNDER_WAVE,   PSYCHO_CUT,     THUNDERBOLT,    FLAMETHROWER,   \
	     CUT,            STRENGTH 
	; end

	db BANK(RaticatePicFront)
