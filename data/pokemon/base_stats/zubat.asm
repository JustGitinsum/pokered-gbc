	db DEX_ZUBAT ; pokedex id

	db  40,  45,  35,  55,  40
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 255 ; catch rate
	db 54 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/zubat.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/zubat.pic", 0, 1 ; sprite dimensions
ENDC
	dw ZubatPicFront, ZubatPicBack

	db MEGA_DRAIN, SUPERSONIC, GUST, BITE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      TOXIC,          X_SCISSOR,      FIRE_FANG,      \
	     SLUDGE_BOMB,    HYPER_BEAM,     POISON_JAB,     SIGNAL_BEAM,    GIGA_DRAIN,     \
		 THUNDERFANG,    DARK_PULSE,     ACCELEROCK,     STEEL_WING,     SHADOW_CLAW,    \
		 SHADOW_BALL,    ICE_FANG,       CUT,            FLY 
	; end

	db BANK(ZubatPicFront)
