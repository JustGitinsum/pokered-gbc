	db DEX_DRATINI ; pokedex id

	db  41,  64,  45,  50,  50
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 67 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/dratini.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/dratini.pic", 0, 1 ; sprite dimensions
ENDC
	dw DratiniPicFront, DratiniPicBack

	db WRAP, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AURORA_BEAM,    DRAGONBREATH,   TOXIC,          POWER_GEM,      \
	     BUBBLEBEAM,     ICE_BEAM,       DRAGON_PULSE,   HYPER_BEAM,     POISON_JAB,     \
		 WATERFALL,      ANCIENTPOWER,   EARTH_POWER,    DARK_PULSE,     GLACIAL_LANCE,  \
		 ACCELEROCK,     HEAT_CRASH,     THUNDER_WAVE,   THUNDERBOLT,    FLAMETHROWER,   \
		 SURF 
	; end

	db BANK(DratiniPicFront)
