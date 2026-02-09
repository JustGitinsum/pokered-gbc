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

	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   MEGA_KICK,    TOXIC,        FIRE_FANG,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     PAY_DAY,      SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     DIG,          MIMIC,        ICE_PUNCH,  ACCELEROCK,         SWIFT,        \
	     FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE,   SURF,         STRENGTH
	; end

	db BANK(PsyduckPicFront)
