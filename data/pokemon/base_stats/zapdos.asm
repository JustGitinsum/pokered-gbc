	db DEX_ZAPDOS ; pokedex id

	db  90,  90,  85, 100, 125
	;   hp  atk  def  spd  spc

	db ELECTRIC, FLYING ; type
	db 3 ; catch rate
	db 216 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/zapdos.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/zapdos.pic", 0, 1 ; sprite dimensions
ENDC
	dw ZapdosPicFront, ZapdosPicBack

	db THUNDERFANG, DRILL_PECK, ANCIENTPOWER, AGILITY ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,   WHIRLWIND,    TOXIC,        BULLDOZE,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         THUNDERFANG,  THUNDER,      MIMIC,        \
	     ICE_PUNCH,  REFLECT,      ACCELEROCK,         SWIFT,        SKY_ATTACK,   \
	     ICE_FANG,         THUNDER_WAVE, SUBSTITUTE,   FLY,          FLASH
	; end

	db BANK(ZapdosPicFront)
