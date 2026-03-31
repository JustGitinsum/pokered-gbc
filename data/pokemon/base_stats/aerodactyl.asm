	db DEX_AERODACTYL ; pokedex id

	db  80, 105,  65, 130,  60
	;   hp  atk  def  spd  spc

	db ROCK, FLYING ; type
	db 45 ; catch rate
	db 202 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/aerodactyl.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/aerodactyl.pic", 0, 1 ; sprite dimensions
ENDC
	dw AerodactylPicFront, AerodactylPicBack

	db WING_ATTACK, AGILITY, BITE, ANCIENTPOWER ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AIR_SLASH,   THIEF,    TOXIC,        BODY_SLAM,    SLUDGE_BOMB,  \
	     HYPER_BEAM,   RAGE,         DRAGON_RAGE,  MIMIC,        ICE_PUNCH,  \
	     REFLECT,      ACCELEROCK,         FIRE_BLAST,   STEEL_WING,        DRAGON_CLAW,   \
	     ICE_FANG,         SUBSTITUTE,   FLY
	; end

	db BANK(AerodactylPicFront)
