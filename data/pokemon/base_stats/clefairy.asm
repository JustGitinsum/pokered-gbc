	db DEX_CLEFAIRY ; pokedex id

	db  70,  45,  48,  35,  60
	;   hp  atk  def  spd  spc

	db FAIRY, FAIRY ; type
	db 150 ; catch rate
	db 68 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/clefairy.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/clefairy.pic", 0, 1 ; sprite dimensions
ENDC
	dw ClefairyPicFront, ClefairyPicBack

	db POUND, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     SLUDGE_BOMB,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, RAGE,         ENERGY_BALL,    \
	     THUNDERFANG,  THUNDER,      PSYCHIC_M,    BRICK_BREAK,     MIMIC,        \
	     ICE_PUNCH,  REFLECT,      ACCELEROCK,         X_SCISSOR,    FIRE_BLAST,   \
	     FIRE_PUNCH,   ICE_FANG,         THUNDER_WAVE, PSYCHO_CUT,      FLAMETHROWER,   \
	     SUBSTITUTE,   STRENGTH,     FLASH
	; end

	db BANK(ClefairyPicFront)
