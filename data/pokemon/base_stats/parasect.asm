	db DEX_PARASECT ; pokedex id

	db  60,  95,  80,  30,  80
	;   hp  atk  def  spd  spc

	db BUG, GRASS ; type
	db 75 ; catch rate
	db 128 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/parasect.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/parasect.pic", 0, 1 ; sprite dimensions
ENDC
	dw ParasectPicFront, ParasectPicBack

	db SCRATCH, STUN_SPORE, LEECH_LIFE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      SLUDGE_BOMB,    \
	     TRAILBLAZE,     HYPER_BEAM,     SPORE,          POISON_JAB,     SIGNAL_BEAM,    \
		 GIGA_DRAIN,     ENERGY_BALL,    MIGHTY_CLEAVE,  DIG,            LEAF_BLADE,     \
		 SHADOW_CLAW,    CUT,            STRENGTH,       FLASH 
	; end

	db BANK(ParasectPicFront)
