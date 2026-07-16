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

	db WING_ATTACK, AGILITY, BITE, DRAGONBREATH ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      DRAGONBREATH,   TOXIC,          FIRE_FANG,      \
	     POWER_GEM,      DRAGON_PULSE,   HYPER_BEAM,     ANCIENTPOWER,   MIGHTY_CLEAVE,  \
		 THUNDERFANG,    AURA_WHEEL,     EARTHQUAKE,     EARTH_POWER,    ACCELEROCK,     \
		 HEAT_CRASH,     STEEL_WING,     SHADOW_CLAW,    DRAGON_CLAW,    ICE_FANG,       \
		 FLAMETHROWER,   FLY,            STRENGTH 
	; end

	db BANK(AerodactylPicFront)
