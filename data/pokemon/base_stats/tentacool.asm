	db DEX_TENTACOOL ; pokedex id

	db  40,  40,  35,  70, 100
	;   hp  atk  def  spd  spc

	db WATER, POISON ; type
	db 190 ; catch rate
	db 105 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/tentacool.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/tentacool.pic", 0, 1 ; sprite dimensions
ENDC
	dw TentacoolPicFront, TentacoolPicBack

	db ACID, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          POWER_GEM,      SLUDGE_BOMB,    \
	     BUBBLEBEAM,     ICE_BEAM,       POISON_JAB,     WATERFALL,      GIGA_DRAIN,     \
		 DARK_PULSE,     GLACIAL_LANCE,  CUT,            SURF 
	; end

	db BANK(TentacoolPicFront)
