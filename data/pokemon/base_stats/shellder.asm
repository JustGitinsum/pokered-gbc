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
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    \
	     ICE_BEAM,     BLIZZARD,     RAGE,         TELEPORT,     MIMIC,        \
	     ICE_PUNCH,  REFLECT,      ACCELEROCK,         SELFDESTRUCT, SWIFT,        \
	     ICE_FANG,         EXPLOSION,    FLAMETHROWER,   SUBSTITUTE,   SURF
	; end

	db BANK(ShellderPicFront)
