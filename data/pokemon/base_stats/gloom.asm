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

	db MEGA_DRAIN, POISONPOWDER, STUN_SPORE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     GIGA_DRAIN,   ENERGY_BALL,    MIMIC,        ICE_PUNCH,  REFLECT,      \
	     ACCELEROCK,         ICE_FANG,         SUBSTITUTE,   CUT
	; end

	db BANK(GloomPicFront)
