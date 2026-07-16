	db DEX_PARAS ; pokedex id

	db  35,  70,  55,  25,  55
	;   hp  atk  def  spd  spc

	db BUG, GRASS ; type
	db 190 ; catch rate
	db 70 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/paras.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/paras.pic", 0, 1 ; sprite dimensions
ENDC
	dw ParasPicFront, ParasPicBack

	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      \
	     SLUDGE_BOMB,    TRAILBLAZE,     HYPER_BEAM,     SPORE,          POISON_JAB,     \
		 SIGNAL_BEAM,    GIGA_DRAIN,     ENERGY_BALL,    MIGHTY_CLEAVE,  DIG,            \
		 LEAF_BLADE,     SHADOW_CLAW,    CUT,            FLASH 
	; end

	db BANK(ParasPicFront)
