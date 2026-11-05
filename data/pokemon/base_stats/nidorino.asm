	db DEX_NIDORINO ; pokedex id

	db  61,  72,  57,  65,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 120 ; catch rate
	db 118 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/nidorino.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/nidorino.pic", 0, 1 ; sprite dimensions
ENDC
	dw NidorinoPicFront, NidorinoPicBack

	db TACKLE, LEER, PECK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          \
	     FIRE_FANG,      SLUDGE_BOMB,    BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       \
		 DRAGON_PULSE,   HYPER_BEAM,     POISON_JAB,     WATERFALL,      MIGHTY_CLEAVE,  \
		 THUNDERFANG,    AURA_WHEEL,     EARTHQUAKE,     EARTH_POWER,    DIG,            \
		 DARK_PULSE,     GLACIAL_LANCE,  ACCELEROCK,     HEAT_CRASH,     SHADOW_BALL,    \
		 ICE_FANG,       THUNDER_WAVE,   THUNDERBOLT,    FLAMETHROWER,   CUT,            \
		 SURF,           STRENGTH 
	; end

	db BANK(NidorinoPicFront)
