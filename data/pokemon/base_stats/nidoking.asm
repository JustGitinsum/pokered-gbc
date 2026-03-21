	db DEX_NIDOKING ; pokedex id

	db  81,  92,  77,  85,  75
	;   hp  atk  def  spd  spc

	db POISON, GROUND ; type
	db 45 ; catch rate
	db 195 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/nidoking.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/nidoking.pic", 0, 1 ; sprite dimensions
ENDC
	dw NidokingPicFront, NidokingPicBack

	db TACKLE, HORN_ATTACK, POISON_FANG, THRASH ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        PLAY_ROUGH,   FIRE_FANG,    \
	     BODY_SLAM,    DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   SIGNAL_BEAM,      EXTREMESPEED,   WATERFALL,      \
	     SEISMIC_TOSS, RAGE,         THUNDERFANG,  THUNDER,      EARTHQUAKE,   \
	     EARTH_POWER,      MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     FIRE_BLAST,   FIRE_PUNCH,   ICE_FANG,         THUNDERBOLT,   SUBSTITUTE,   \
	     SURF,         STRENGTH
	; end

	db BANK(NidokingPicFront)
