	db DEX_CROBAT ; pokedex id

	db  85,  90,  80,  130,  70
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 90 ; catch rate
	db 241 ; base exp

	INCBIN "gfx/pokemon/gsfront/crobat.pic", 0, 1 ; sprite dimensions
	dw CrobatPicFront, CrobatPicBack

	db MEGA_DRAIN, SCREECH, SUPERSONIC, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      TOXIC,          X_SCISSOR,      FIRE_FANG,      \
	     SLUDGE_BOMB,    HYPER_BEAM,     POISON_JAB,     SIGNAL_BEAM,    GIGA_DRAIN,     \
		 THUNDERFANG,    DARK_PULSE,     ACCELEROCK,     STEEL_WING,     SHADOW_CLAW,    \
		 SHADOW_BALL,    ICE_FANG,       CUT,            FLY 
	; end

	db BANK(CrobatPicFront)
