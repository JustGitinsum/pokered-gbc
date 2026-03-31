	db DEX_MANKEY ; pokedex id

	db  40,  80,  35,  70,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 190 ; catch rate
	db 74 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/mankey.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/mankey.pic", 0, 1 ; sprite dimensions
ENDC
	dw MankeyPicFront, MankeyPicBack

	db SCRATCH, LEER, FOCUS_ENERGY, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BODY_SLAM,    \
	     SLUDGE_BOMB,  SIGNAL_BEAM,      EXTREMESPEED,   WATERFALL,      SEISMIC_TOSS, \
	     RAGE,         THUNDERFANG,  THUNDER,      DIG,          MIMIC,        \
	     ICE_PUNCH,  ACCELEROCK,         X_SCISSOR,    STEEL_WING,        FIRE_PUNCH,   \
	     ICE_FANG,         THUNDERBOLT,   SUBSTITUTE,   STRENGTH
	; end

	db BANK(MankeyPicFront)
