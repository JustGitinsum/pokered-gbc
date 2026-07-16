	db DEX_EKANS ; pokedex id

	db  35,  60,  44,  55,  40
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 255 ; catch rate
	db 62 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/ekans.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/ekans.pic", 0, 1 ; sprite dimensions
ENDC
	dw EkansPicFront, EkansPicBack

	db WRAP, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm DRAGONBREATH,   TOXIC,          FIRE_FANG,      SLUDGE_BOMB,    TRAILBLAZE,     \
	     DRAGON_PULSE,   HYPER_BEAM,     POISON_JAB,     GIGA_DRAIN,     THUNDERFANG,    \
		 EARTHQUAKE,     EARTH_POWER,    DIG,            DARK_PULSE,     ICE_FANG,       \
		 STRENGTH 
	; end

	db BANK(EkansPicFront)
