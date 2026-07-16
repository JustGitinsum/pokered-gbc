	db DEX_RATTATA ; pokedex id

	db  30,  56,  35,  72,  25
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 57 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/rattata.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/rattata.pic", 0, 1 ; sprite dimensions
ENDC
	dw RattataPicFront, RattataPicBack

	db TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          FIRE_FANG,      \
	     SLUDGE_BOMB,    BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       HYPER_BEAM,     \
	     POISON_JAB,     MIGHTY_CLEAVE,  THUNDERFANG,    AURA_WHEEL,     DIG,            \
		 DARK_PULSE,     ACCELEROCK,     SHADOW_CLAW,    SHADOW_BALL,    DRAGON_CLAW,    \
		 ICE_FANG,       THUNDER_WAVE,   PSYCHO_CUT,     THUNDERBOLT,    FLAMETHROWER,   \
	     CUT,            STRENGTH 
	; end

	db BANK(RattataPicFront)
