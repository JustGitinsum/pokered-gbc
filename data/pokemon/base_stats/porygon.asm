	db DEX_PORYGON ; pokedex id

	db  65,  60,  70,  40,  75
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 130 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/porygon.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/porygon.pic", 0, 1 ; sprite dimensions
ENDC
	dw PorygonPicFront, PorygonPicBack

	db TACKLE, SHARPEN, CONVERSION, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   RAGE,         THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        ICE_PUNCH,  REFLECT,      BIDE,         \
	     SWIFT,        FIRE_PUNCH,   REST,         THUNDER_WAVE, PSYWAVE,      \
	     FLAMETHROWER,   SUBSTITUTE,   FLASH
	; end

	db BANK(PorygonPicFront)
