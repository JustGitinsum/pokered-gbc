	db DEX_SQUIRTLE ; pokedex id

	db  44,  48,  65,  43,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 66 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/squirtle.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/squirtle.pic", 0, 1 ; sprite dimensions
ENDC
	dw SquirtlePicFront, SquirtlePicBack

	db POUND, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          BUBBLEBEAM,     \
	     TRAILBLAZE,     ICE_BEAM,       DRAGON_PULSE,   HYPER_BEAM,     POISON_JAB,     \
		 WATERFALL,      MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    DIG,            \
		 DARK_PULSE,     ICE_PUNCH,      ACCELEROCK,     ICE_FANG,       AURA_SPHERE,    \
		 SURF,           STRENGTH 
	; end

	db BANK(SquirtlePicFront)
