	db DEX_PERSIAN ; pokedex id

	db  65,  70,  60, 115,  65
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 148 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/persian.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/persian.pic", 0, 1 ; sprite dimensions
ENDC
	dw PersianPicFront, PersianPicBack

	db SCRATCH, GROWL, BITE, SCREECH ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        FIRE_FANG,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     TRAILBLAZE,    HYPER_BEAM,   PAY_DAY,      RAGE,         THUNDERFANG,  \
	     THUNDER,      MIMIC,        ICE_PUNCH,  ACCELEROCK,         SWIFT,        \
	     FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE
	; end

	db BANK(PersianPicFront)
