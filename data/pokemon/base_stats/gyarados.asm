	db DEX_GYARADOS ; pokedex id

	db  95, 125,  79,  81, 100
	;   hp  atk  def  spd  spc

	db WATER, FLYING ; type
	db 45 ; catch rate
	db 214 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/gyarados.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/gyarados.pic", 0, 1 ; sprite dimensions
ENDC
	dw GyaradosPicFront, GyaradosPicBack

	db BITE, DRAGON_RAGE, LEER, HYDRO_PUMP ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    BULLDOZE,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         \
	     DRAGON_RAGE,  THUNDERFANG,  THUNDER,      MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         FIRE_BLAST,   FIRE_PUNCH,   ICE_FANG,         \
	     SUBSTITUTE,   SURF,         STRENGTH
	; end

	db BANK(GyaradosPicFront)
