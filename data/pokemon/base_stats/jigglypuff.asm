	db DEX_JIGGLYPUFF ; pokedex id

	db 115,  45,  20,  20,  25
	;   hp  atk  def  spd  spc

	db NORMAL, FAIRY ; type
	db 170 ; catch rate
	db 76 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/jigglypuff.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/jigglypuff.pic", 0, 1 ; sprite dimensions
ENDC
	dw JigglypuffPicFront, JigglypuffPicBack

	db SING, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, RAGE,         ENERGY_BALL,    \
	     THUNDERFANG,  THUNDER,      PSYCHIC_M,    TELEPORT,     MIMIC,        \
	     ICE_PUNCH,  REFLECT,      ACCELEROCK,         FIRE_BLAST,   FIRE_PUNCH,   \
	     ICE_FANG,         THUNDER_WAVE, EXTRASENSORY,      FLAMETHROWER,   SUBSTITUTE,   \
	     STRENGTH,     FLASH
	; end

	db BANK(JigglypuffPicFront)
