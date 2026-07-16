	db DEX_VICTREEBEL ; pokedex id

	db  80, 105,  65,  70, 100
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 191 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/victreebel.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/victreebel.pic", 0, 1 ; sprite dimensions
ENDC
	dw VictreebelPicFront, VictreebelPicBack

	db VINE_WHIP, GROWTH, ACID, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,          SLUDGE_BOMB,    TRAILBLAZE,     HYPER_BEAM,     SPORE,          \
	     POISON_JAB,     SIGNAL_BEAM,    GIGA_DRAIN,     ENERGY_BALL,    LEAF_BLADE,     \
		 MOONBLAST,      CUT,            FLASH
	; end

	db BANK(VictreebelPicFront)
