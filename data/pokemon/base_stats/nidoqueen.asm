	db DEX_NIDOQUEEN ; pokedex id

	db  90,  92,  87,  76,  75,  85
	;   hp  atk  def  spd  sat  sdf

	db POISON, GROUND ; type
	db 45 ; catch rate
	db 194 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/nidoqueen.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/nidoqueen.pic", 0, 1 ; sprite dimensions
ENDC
	dw NidoqueenPicFront, NidoqueenPicBack

	db GROWL, SCRATCH, NO_MOVE, NO_MOVE ; level 1 learnset
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

	db BANK(NidoqueenPicFront)
