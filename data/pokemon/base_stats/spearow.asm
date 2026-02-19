	db DEX_SPEAROW ; pokedex id

	db  40,  60,  30,  70,  31
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 255 ; catch rate
	db 58 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/spearow.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/spearow.pic", 0, 1 ; sprite dimensions
ENDC
	dw SpearowPicFront, SpearowPicBack

	db PECK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,   WHIRLWIND,    TOXIC,        BULLDOZE,    DOUBLE_EDGE,  \
	     RAGE,         MIMIC,        ICE_PUNCH,  ACCELEROCK,         SWIFT,        \
	     SKY_ATTACK,   ICE_FANG,         SUBSTITUTE,   FLY
	; end

	db BANK(SpearowPicFront)
