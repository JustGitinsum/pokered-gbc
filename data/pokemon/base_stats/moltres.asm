	db DEX_MOLTRES ; pokedex id

	db  90, 100,  90,  90, 125
	;   hp  atk  def  spd  spc

	db FIRE, FLYING ; type
	db 3 ; catch rate
	db 217 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/moltres.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/moltres.pic", 0, 1 ; sprite dimensions
ENDC
	dw MoltresPicFront, MoltresPicBack

	db WING_ATTACK, FLAMETHROWER, ANCIENTPOWER, AGILITY ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,   WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MIMIC,        ICE_PUNCH,  REFLECT,      \
	     ACCELEROCK,         FIRE_BLAST,   SWIFT,        SKY_ATTACK,   ICE_FANG,         \
	     SUBSTITUTE,   FLY
	; end

	db BANK(MoltresPicFront)
