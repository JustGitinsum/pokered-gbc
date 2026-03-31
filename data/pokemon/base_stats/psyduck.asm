	db DEX_PSYDUCK ; pokedex id

	db  50,  52,  48,  55,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 190 ; catch rate
	db 80 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/psyduck.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/psyduck.pic", 0, 1 ; sprite dimensions
ENDC
	dw PsyduckPicFront, PsyduckPicBack

	db SCRATCH, TAIL_WHIP, WATER_GUN, CONFUSION ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     SLUDGE_BOMB,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     SIGNAL_BEAM,      EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, RAGE,         \
	     DIG,          MIMIC,        ICE_PUNCH,  ACCELEROCK,         STEEL_WING,        \
	     FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE,   SURF,         STRENGTH
	; end

	db BANK(PsyduckPicFront)
