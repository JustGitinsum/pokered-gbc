	db DEX_ARBOK ; pokedex id

	db  60,  85,  69,  80,  65
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 90 ; catch rate
	db 147 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/arbok.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/arbok.pic", 0, 1 ; sprite dimensions
ENDC
	dw ArbokPicFront, ArbokPicBack

	db WRAP, LEER, POISON_FANG, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm DRAGONBREATH,   TOXIC,          FIRE_FANG,      SLUDGE_BOMB,    TRAILBLAZE,     \
	     DRAGON_PULSE,   HYPER_BEAM,     POISON_JAB,     GIGA_DRAIN,     THUNDERFANG,    \
		 EARTHQUAKE,     EARTH_POWER,    DIG,            DARK_PULSE,     ICE_FANG,       \
		 STRENGTH 
	; end

	db BANK(ArbokPicFront)
