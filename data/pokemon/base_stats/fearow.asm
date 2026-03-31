	db DEX_FEAROW ; pokedex id

	db  65,  90,  65, 100,  61
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 90 ; catch rate
	db 162 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/fearow.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/fearow.pic", 0, 1 ; sprite dimensions
ENDC
	dw FearowPicFront, FearowPicBack

	db PECK, GROWL, LEER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,   THIEF,    TOXIC,        BODY_SLAM,    SLUDGE_BOMB,  \
	     HYPER_BEAM,   RAGE,         MIMIC,        ICE_PUNCH,  ACCELEROCK,         \
	     STEEL_WING,        DRAGON_CLAW,   ICE_FANG,         SUBSTITUTE,   FLY
	; end

	db BANK(FearowPicFront)
