	db DEX_TENTACRUEL ; pokedex id

	db  80,  70,  65, 100, 120
	;   hp  atk  def  spd  spc

	db WATER, POISON ; type
	db 60 ; catch rate
	db 205 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/tentacruel.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/tentacruel.pic", 0, 1 ; sprite dimensions
ENDC
	dw TentacruelPicFront, TentacruelPicBack

	db ACID, SUPERSONIC, WRAP, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          POWER_GEM,      SLUDGE_BOMB,    \
	     BUBBLEBEAM,     ICE_BEAM,       HYPER_BEAM,     POISON_JAB,     WATERFALL,      \
		 GIGA_DRAIN,     DARK_PULSE,     GLACIAL_LANCE,  CUT,            SURF 
	; end

	db BANK(TentacruelPicFront)
