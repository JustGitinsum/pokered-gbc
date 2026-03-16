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

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    BODY_SLAM,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     TRAILBLAZE,    SIGNAL_BEAM,      RAGE,         THUNDERFANG,  THUNDER,      \
	     MIMIC,        ICE_PUNCH,  ACCELEROCK,         STEEL_WING,        FIRE_PUNCH,   \
	     ICE_FANG,         SUBSTITUTE
	; end

	db BANK(MeowthPicFront)
