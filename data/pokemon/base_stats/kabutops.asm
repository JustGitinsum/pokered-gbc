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

	db WATER_GUN, HARDEN, METAL_CLAW, ANCIENTPOWER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          \
	     X_SCISSOR,      BUBBLEBEAM,     ICE_BEAM,       HYPER_BEAM,     WATERFALL,      \
		 ANCIENTPOWER,   GIGA_DRAIN,     MIGHTY_CLEAVE,  EARTH_POWER,    DIG,            \
		 GLACIAL_LANCE,  ACCELEROCK,     LEAF_BLADE,     SHADOW_CLAW,    DRAGON_CLAW,    \
		 PSYCHO_CUT,     CUT,            SURF 
	; end

	db BANK(KabutopsPicFront)
