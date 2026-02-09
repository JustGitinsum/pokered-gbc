	db DEX_STARYU ; pokedex id

	db  30,  45,  55,  85,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 106 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/staryu.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/staryu.pic", 0, 1 ; sprite dimensions
ENDC
	dw StaryuPicFront, StaryuPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    \
	     ICE_BEAM,     BLIZZARD,     RAGE,         THUNDERFANG,  THUNDER,      \
	     PSYCHIC_M,    TELEPORT,     MIMIC,        ICE_PUNCH,  REFLECT,      \
	     ACCELEROCK,         SWIFT,        FIRE_PUNCH,   ICE_FANG,         THUNDER_WAVE, \
	     EXTRASENSORY,      FLAMETHROWER,   SUBSTITUTE,   SURF,         FLASH
	; end

	db BANK(StaryuPicFront)
