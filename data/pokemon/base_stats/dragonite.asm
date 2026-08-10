	db DEX_DRAGONITE ; pokedex id

	db  91, 134,  95,  80, 100
	;   hp  atk  def  spd  spc

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 218 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/dragonite.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/dragonite.pic", 0, 1 ; sprite dimensions
ENDC
	dw DragonitePicFront, DragonitePicBack

	db POUND, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      AURORA_BEAM,    DRAGONBREATH,   CLOSE_COMBAT,   \
	     TOXIC,          POWER_GEM,      BUBBLEBEAM,     ICE_BEAM,       DRAGON_PULSE,   \
		 HYPER_BEAM,     POISON_JAB,     WATERFALL,      ANCIENTPOWER,   MIGHTY_CLEAVE,  \
		 AURA_WHEEL,     EARTHQUAKE,     EARTH_POWER,    DARK_PULSE,     ICE_PUNCH,      \
		 GLACIAL_LANCE,  ACCELEROCK,     THUNDERPUNCH,   HEAT_CRASH,     STEEL_WING,     \
		 FIRE_PUNCH,     DRAGON_CLAW,    THUNDER_WAVE,   THUNDERBOLT,    FLAMETHROWER,   \
		 CUT,            FLY,            SURF,           STRENGTH 
	; end

	db BANK(DragonitePicFront)
