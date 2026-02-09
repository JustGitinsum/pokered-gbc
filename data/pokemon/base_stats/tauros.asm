	db DEX_TAUROS ; pokedex id

	db  75, 100,  95, 110,  70
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 211 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/tauros.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/tauros.pic", 0, 1 ; sprite dimensions
ENDC
	dw TaurosPicFront, TaurosPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         THUNDERFANG,  \
	     THUNDER,      EARTHQUAKE,   EARTH_POWER,      MIMIC,        ICE_PUNCH,  \
	     ACCELEROCK,         FIRE_BLAST,   FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE,   \
	     STRENGTH
	; end

	db BANK(TaurosPicFront)
