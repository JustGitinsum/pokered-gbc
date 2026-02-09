	db DEX_KABUTOPS ; pokedex id

	db  60, 115, 105,  80,  70
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 201 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/kabutops.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/kabutops.pic", 0, 1 ; sprite dimensions
ENDC
	dw KabutopsPicFront, KabutopsPicBack

	db TRAILBLAZE, HARDEN, SLASH, ANCIENTPOWER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,   SWORDS_DANCE, MEGA_KICK,    TOXIC,        FIRE_FANG,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   TRAILBLAZE,    ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   SUBMISSION,   SEISMIC_TOSS, RAGE,         \
	     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         FIRE_PUNCH,   \
	     ICE_FANG,         SUBSTITUTE,   SURF
	; end

	db BANK(KabutopsPicFront)
