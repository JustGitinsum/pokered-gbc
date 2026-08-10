	db DEX_CLOYSTER ; pokedex id

	db  50,  95, 180,  70,  85
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db 60 ; catch rate
	db 203 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/cloyster.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/cloyster.pic", 0, 1 ; sprite dimensions
ENDC
	dw CloysterPicFront, CloysterPicBack

	db WITHDRAW, SUPERSONIC, AURORA_BEAM, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    TOXIC,          POWER_GEM,      BUBBLEBEAM,     ICE_BEAM,       \
	     HYPER_BEAM,     POISON_JAB,     WATERFALL,      ANCIENTPOWER,   MIGHTY_CLEAVE,  \
		 ACCELEROCK,     SURF 
	; end

	db BANK(CloysterPicFront)
