	db DEX_SHELLDER ; pokedex id

	db  30,  65, 100,  40,  45
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 190 ; catch rate
	db 97 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/shellder.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/shellder.pic", 0, 1 ; sprite dimensions
ENDC
	dw ShellderPicFront, ShellderPicBack

	db TACKLE, WITHDRAW, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    TOXIC,          POWER_GEM,      BUBBLEBEAM,     ICE_BEAM,       \
	     HYPER_BEAM,     POISON_JAB,     WATERFALL,      ANCIENTPOWER,   MIGHTY_CLEAVE,  \
		 ACCELEROCK,     SURF 
	; end

	db BANK(ShellderPicFront)
