	db DEX_DRAGONAIR ; pokedex id

	db  61,  84,  65,  70,  70
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 144 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/dragonair.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/dragonair.pic", 0, 1 ; sprite dimensions
ENDC
	dw DragonairPicFront, DragonairPicBack

	db WRAP, LEER, THUNDER_WAVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   FIRE_FANG,    BULLDOZE,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     RAGE,         \
	     DRAGON_RAGE,  THUNDERFANG,  THUNDER,      MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         FIRE_BLAST,   SWIFT,        FIRE_PUNCH,   \
	     ICE_FANG,         THUNDER_WAVE, SUBSTITUTE,   SURF
	; end

	db BANK(DragonairPicFront)
