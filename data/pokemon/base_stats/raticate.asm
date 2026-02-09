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
	tmhm TOXIC,        FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         \
	     THUNDERFANG,  THUNDER,      DIG,          MIMIC,        ICE_PUNCH,  \
	     ACCELEROCK,         SWIFT,        FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE
	; end

	db BANK(RaticatePicFront)
