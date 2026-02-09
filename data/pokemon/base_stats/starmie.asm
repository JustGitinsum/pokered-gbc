	db DEX_STARMIE ; pokedex id

	db  60,  75,  85, 115, 100
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db 60 ; catch rate
	db 207 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/starmie.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/starmie.pic", 0, 1 ; sprite dimensions
ENDC
	dw StarmiePicFront, StarmiePicBack

	db TACKLE, TRAILBLAZE, HARDEN, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         THUNDERFANG,  \
	     THUNDER,      PSYCHIC_M,    TELEPORT,     MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         SWIFT,        FIRE_PUNCH,   ICE_FANG,         \
	     THUNDER_WAVE, EXTRASENSORY,      FLAMETHROWER,   SUBSTITUTE,   SURF,         \
	     FLASH
	; end

	db BANK(StarmiePicFront)
