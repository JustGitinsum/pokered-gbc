	db DEX_ARTICUNO ; pokedex id

	db  90,  85, 100,  85, 125
	;   hp  atk  def  spd  spc

	db ICE, FLYING ; type
	db 3 ; catch rate
	db 215 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/articuno.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/articuno.pic", 0, 1 ; sprite dimensions
ENDC
	dw ArticunoPicFront, ArticunoPicBack

	db WING_ATTACK, ICE_BEAM, ANCIENTPOWER, AGILITY ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,   WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     RAGE,         MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     SWIFT,        SKY_ATTACK,   ICE_FANG,         SUBSTITUTE,   FLY
	; end

	db BANK(ArticunoPicFront)
