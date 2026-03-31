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

	db TACKLE, WATER_GUN, HARDEN, CONFUSE_RAY ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    SLUDGE_BOMB,  BUBBLEBEAM,   TRAILBLAZE,    \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         THUNDERFANG,  \
	     THUNDER,      PSYCHIC_M,    BRICK_BREAK,     MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         STEEL_WING,        FIRE_PUNCH,   ICE_FANG,         \
	     THUNDER_WAVE, PSYCHO_CUT,      FLAMETHROWER,   SUBSTITUTE,   SURF,         \
	     FLASH
	; end

	db BANK(StarmiePicFront)
