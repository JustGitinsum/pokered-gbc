	db DEX_BEEDRILL ; pokedex id

	db  65,  80,  40,  75,  45
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 45 ; catch rate
	db 159 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/beedrill.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/beedrill.pic", 0, 1 ; sprite dimensions
ENDC
	dw BeedrillPicFront, BeedrillPicBack

	db POISON_FANG, STRING_SHOT, POUNCE, ELECTROWEB ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          X_SCISSOR,      \
	     SLUDGE_BOMB,    HYPER_BEAM,     SPORE,          POISON_JAB,     SIGNAL_BEAM,    \
	     GIGA_DRAIN,     MIGHTY_CLEAVE,  AURA_WHEEL,     GLACIAL_LANCE,  ACCELEROCK,     \
		 LEAF_BLADE,     STEEL_WING,     PSYCHO_CUT,     CUT,            FLY,            \
		 FLASH 
	; end

	db BANK(BeedrillPicFront)
