	db DEX_NINETALES ; pokedex id

	db  73,  76,  75, 100, 100
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 75 ; catch rate
	db 178 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/ninetales.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/ninetales.pic", 0, 1 ; sprite dimensions
ENDC
	dw NinetalesPicFront, NinetalesPicBack

	db EMBER, TAIL_WHIP, QUICK_ATTACK, ROAR ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         DIG,          MIMIC,        ICE_PUNCH,  REFLECT,      \
	     BIDE,         FIRE_BLAST,   SWIFT,        FIRE_PUNCH,   REST,         \
	     SUBSTITUTE
	; end

	db BANK(NinetalesPicFront)
