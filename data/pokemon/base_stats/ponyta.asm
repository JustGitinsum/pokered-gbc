	db DEX_PONYTA ; pokedex id

	db  50,  85,  55,  90,  65
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 190 ; catch rate
	db 152 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/ponyta.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/ponyta.pic", 0, 1 ; sprite dimensions
ENDC
	dw PonytaPicFront, PonytaPicBack

	db GROWL, TACKLE, TAIL_WHIP, EMBER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        PLAY_ROUGH,   FIRE_FANG,    BODY_SLAM,    SLUDGE_BOMB,  \
	     RAGE,         MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     FIRE_BLAST,   STEEL_WING,        FIRE_PUNCH,   ICE_FANG,         SUBSTITUTE
	; end

	db BANK(PonytaPicFront)
