	db DEX_BELLSPROUT ; pokedex id

	db  50,  75,  35,  40,  70
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 255 ; catch rate
	db 84 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/bellsprout.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/bellsprout.pic", 0, 1 ; sprite dimensions
ENDC
	dw BellsproutPicFront, BellsproutPicBack

	db VINE_WHIP, GROWTH, ACID, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,          SLUDGE_BOMB,    TRAILBLAZE,     HYPER_BEAM,     SPORE,          \
	     POISON_JAB,     SIGNAL_BEAM,    GIGA_DRAIN,     ENERGY_BALL,    LEAF_BLADE,     \
		 MOONBLAST,      CUT,            FLASH
	; end

	db BANK(BellsproutPicFront)
