	db DEX_GOLBAT ; pokedex id

	db  75,  80,  70,  90,  75
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 90 ; catch rate
	db 171 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/golbat.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/golbat.pic", 0, 1 ; sprite dimensions
ENDC
	dw GolbatPicFront, GolbatPicBack

	db MEGA_DRAIN, SUPERSONIC, GUST, BITE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      TOXIC,          X_SCISSOR,      FIRE_FANG,      \
	     SLUDGE_BOMB,    HYPER_BEAM,     POISON_JAB,     SIGNAL_BEAM,    GIGA_DRAIN,     \
		 THUNDERFANG,    DARK_PULSE,     ACCELEROCK,     STEEL_WING,     SHADOW_CLAW,    \
		 SHADOW_BALL,    ICE_FANG,       CUT,            FLY 
	; end

	db BANK(GolbatPicFront)
