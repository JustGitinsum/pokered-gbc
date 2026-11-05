	db DEX_NIDOKING ; pokedex id

	db  81,  102,  77,  85,  85,  75
	;   hp  atk  def  spd  sat  sdf

	db POISON, GROUND ; type
	db 45 ; catch rate
	db 195 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/nidoking.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/nidoking.pic", 0, 1 ; sprite dimensions
ENDC
	dw NidokingPicFront, NidokingPicBack

	db TACKLE, LEER, PECK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          \
	     FIRE_FANG,      SLUDGE_BOMB,    BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       \
		 DRAGON_PULSE,   HYPER_BEAM,     POISON_JAB,     WATERFALL,      MIGHTY_CLEAVE,  \
		 THUNDERFANG,    AURA_WHEEL,     EARTHQUAKE,     EARTH_POWER,    DIG,            \
		 DARK_PULSE,     ICE_PUNCH,      GLACIAL_LANCE,  ACCELEROCK,     THUNDERPUNCH,   \
		 HEAT_CRASH,     FIRE_PUNCH,     SHADOW_CLAW,    SHADOW_BALL,    DRAGON_CLAW,    \
		 ICE_FANG,       THUNDER_WAVE,   THUNDERBOLT,    FLAMETHROWER,   CUT,            \
		 SURF,           STRENGTH 
	; end

	db BANK(NidokingPicFront)
