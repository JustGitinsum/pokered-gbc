	db DEX_DRAGONITE ; pokedex id

	db  91, 134,  95,  80, 100
	;   hp  atk  def  spd  spc

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 218 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/dragonite.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/dragonite.pic", 0, 1 ; sprite dimensions
ENDC
	dw DragonitePicFront, DragonitePicBack

	db WRAP, LEER, THUNDER_WAVE, AGILITY ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,   TOXIC,        HORN_DRILL,   FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   RAGE,         DRAGON_RAGE,  THUNDERFANG,  THUNDER,      \
	     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         FIRE_BLAST,   \
	     SWIFT,        FIRE_PUNCH,   ICE_FANG,         THUNDER_WAVE, SUBSTITUTE,   \
	     SURF,         STRENGTH
	; end

	db BANK(DragonitePicFront)
