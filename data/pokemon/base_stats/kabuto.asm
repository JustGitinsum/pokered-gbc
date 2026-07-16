	db DEX_KABUTO ; pokedex id

	db  30,  80,  90,  55,  45
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 119 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/kabuto.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/kabuto.pic", 0, 1 ; sprite dimensions
ENDC
	dw KabutoPicFront, KabutoPicBack

	db WATER_GUN, HARDEN, METAL_CLAW, ANCIENTPOWER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AURORA_BEAM,    TOXIC,          BUBBLEBEAM,     ICE_BEAM,       \
	     HYPER_BEAM,     WATERFALL,      ANCIENTPOWER,   GIGA_DRAIN,     EARTH_POWER,    \
		 DIG,            GLACIAL_LANCE,  ACCELEROCK,     SURF 		 
	; end

	db BANK(KabutoPicFront)
