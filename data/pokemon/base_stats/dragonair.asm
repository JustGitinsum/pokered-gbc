	db DEX_DRAGONAIR ; pokedex id

	db  61,  84,  65,  70,  70
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 144 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/dragonair.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/dragonair.pic", 0, 1 ; sprite dimensions
ENDC
	dw DragonairPicFront, DragonairPicBack

	db WRAP, LEER, THUNDER_WAVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AURORA_BEAM,    DRAGONBREATH,   TOXIC,          POWER_GEM,      \
	     BUBBLEBEAM,     ICE_BEAM,       DRAGON_PULSE,   HYPER_BEAM,     POISON_JAB,     \
		 WATERFALL,      ANCIENTPOWER,   EARTH_POWER,    DARK_PULSE,     GLACIAL_LANCE,  \
		 ACCELEROCK,     HEAT_CRASH,     THUNDER_WAVE,   THUNDERBOLT,    FLAMETHROWER,   \
		 SURF 
	; end

	db BANK(DragonairPicFront)
