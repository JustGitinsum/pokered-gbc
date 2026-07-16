	db DEX_GLOOM ; pokedex id

	db  60,  65,  70,  40,  85
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 120 ; catch rate
	db 132 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/gloom.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/gloom.pic", 0, 1 ; sprite dimensions
ENDC
	dw GloomPicFront, GloomPicBack

	db MEGA_DRAIN, POISONPOWDER, GROWTH, ACID ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,          SLUDGE_BOMB,    TRAILBLAZE,     SPORE,          GIGA_DRAIN,     \
	     ENERGY_BALL,    EARTH_POWER,    LEAF_BLADE,     MOONBLAST,      CUT,            \
	     FLASH 
	; end

	db BANK(GloomPicFront)
