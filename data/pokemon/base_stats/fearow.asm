	db DEX_FEAROW ; pokedex id

	db  65,  90,  65, 100,  61
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 90 ; catch rate
	db 162 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/fearow.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/fearow.pic", 0, 1 ; sprite dimensions
ENDC
	dw FearowPicFront, FearowPicBack

	db PECK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          HYPER_BEAM,     \
	     MIGHTY_CLEAVE,  ACCELEROCK,     STEEL_WING,     CUT,            FLY 
	; end

	db BANK(FearowPicFront)
