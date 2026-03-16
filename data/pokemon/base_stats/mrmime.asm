	db DEX_MR_MIME ; pokedex id

	db  40,  45,  65,  90, 100
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 136 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/mr.mime.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/mr.mime.pic", 0, 1 ; sprite dimensions
ENDC
	dw MrMimePicFront, MrMimePicBack

	db TACKLE, HYPNOSIS, CONFUSE_RAY, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, \
	     RAGE,         ENERGY_BALL,    THUNDERFANG,  THUNDER,      PSYCHIC_M,    \
	     BRICK_BREAK,     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     METRONOME,    FIRE_PUNCH,   ICE_FANG,         THUNDER_WAVE, PSYCHO_CUT,      \
	     SUBSTITUTE,   FLASH
	; end

	db BANK(MrMimePicFront)
