	db DEX_JYNX ; pokedex id

	db  65,  50,  35,  95,  95
	;   hp  atk  def  spd  spc

	db ICE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 137 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/jynx.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/jynx.pic", 0, 1 ; sprite dimensions
ENDC
	dw JynxPicFront, JynxPicBack

	db POUND, LOVELY_KISS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,   CLOSE_COMBAT,    TOXIC,        FIRE_FANG,    BULLDOZE,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   EXTREMESPEED,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     PSYCHIC_M,    TELEPORT,     MIMIC,        ICE_PUNCH,  REFLECT,      \
	     ACCELEROCK,         METRONOME,    FIRE_PUNCH,   ICE_FANG,         EXTRASENSORY,      \
	     SUBSTITUTE
	; end

	db BANK(JynxPicFront)
