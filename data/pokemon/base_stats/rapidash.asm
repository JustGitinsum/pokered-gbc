	db DEX_RAPIDASH ; pokedex id

	db  65, 100,  70, 105,  80
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 60 ; catch rate
	db 192 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/rapidash.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/rapidash.pic", 0, 1 ; sprite dimensions
ENDC
	dw RapidashPicFront, RapidashPicBack

	db EMBER, TAIL_WHIP, STOMP, GROWL ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TOXIC,          TRAILBLAZE,     HYPER_BEAM,     \
	     SPORE,          POISON_JAB,     SIGNAL_BEAM,    ENERGY_BALL,    MIGHTY_CLEAVE,  \
	     ACCELEROCK,     HEAT_CRASH,     FLAMETHROWER,   MOONBLAST,      CUT,            \
		 STRENGTH,       FLASH 
	; end

	db BANK(RapidashPicFront)
