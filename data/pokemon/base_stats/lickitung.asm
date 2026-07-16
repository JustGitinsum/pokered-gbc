	db DEX_LICKITUNG ; pokedex id

	db  90,  55,  75,  30,  60
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 127 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/lickitung.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/lickitung.pic", 0, 1 ; sprite dimensions
ENDC
	dw LickitungPicFront, LickitungPicBack

	db TACKLE, DEFENSE_CURL, LICK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          BUBBLEBEAM,     \
	     TRAILBLAZE,     ICE_BEAM,       HYPER_BEAM,     POISON_JAB,     WATERFALL,      \
		 EARTHQUAKE,     DIG,            ICE_PUNCH,      ACCELEROCK,     THUNDERPUNCH,   \
		 FIRE_PUNCH,     SHADOW_BALL,    THUNDER_WAVE,   AURA_SPHERE,    THUNDERBOLT,    \
		 FLAMETHROWER,   MOONBLAST,      CUT,            SURF,           STRENGTH 
	; end

	db BANK(LickitungPicFront)
