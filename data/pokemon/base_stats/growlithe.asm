	db DEX_GROWLITHE ; pokedex id

	db  55,  70,  45,  60,  50
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 190 ; catch rate
	db 91 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/growlithe.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/growlithe.pic", 0, 1 ; sprite dimensions
ENDC
	dw GrowlithePicFront, GrowlithePicBack

	db EMBER, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          FIRE_FANG,      \
	     POWER_GEM,      DRAGON_PULSE,   HYPER_BEAM,     ANCIENTPOWER,   MIGHTY_CLEAVE,  \
		 THUNDERFANG,    DIG,            ACCELEROCK,     HEAT_CRASH,     FLAMETHROWER,   \
		 STRENGTH 
	; end

	db BANK(GrowlithePicFront)
