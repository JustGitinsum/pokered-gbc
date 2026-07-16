	db DEX_POLIWAG ; pokedex id

	db  40,  50,  40,  90,  40
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 255 ; catch rate
	db 77 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/poliwag.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/poliwag.pic", 0, 1 ; sprite dimensions
ENDC
	dw PoliwagPicFront, PoliwagPicBack

	db BUBBLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    TOXIC,          BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       \
	     WATERFALL,      SIGNAL_BEAM,    DIG,            PSYCHIC_M,      PSYBEAM,        \
		 DARK_PULSE,     SURF,           STRENGTH 
	; end

	db BANK(PoliwagPicFront)
