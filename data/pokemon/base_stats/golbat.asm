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
	tmhm AIR_SLASH,   SILVER_WIND,    TOXIC,        BODY_SLAM,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         GIGA_DRAIN,   MIMIC,        ICE_PUNCH,  \
	     ACCELEROCK,         STEEL_WING,        ICE_FANG,         SUBSTITUTE
	; end

	db BANK(GolbatPicFront)
