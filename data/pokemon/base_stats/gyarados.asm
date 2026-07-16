	db DEX_GYARADOS ; pokedex id

	db  95, 125,  79,  81, 100
	;   hp  atk  def  spd  spc

	db WATER, FLYING ; type
	db 45 ; catch rate
	db 214 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/gyarados.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/gyarados.pic", 0, 1 ; sprite dimensions
ENDC
	dw GyaradosPicFront, GyaradosPicBack

	db BITE, DRAGON_RAGE, LEER, HYDRO_PUMP ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      AURORA_BEAM,    DRAGONBREATH,   TOXIC,          \
	     FIRE_FANG,      BUBBLEBEAM,     ICE_BEAM,       DRAGON_PULSE,   HYPER_BEAM,     \
	     WATERFALL,      THUNDERFANG,    AURA_WHEEL,     EARTHQUAKE,     EARTH_POWER,    \
	     DARK_PULSE,     GLACIAL_LANCE,  ACCELEROCK,     ICE_FANG,       THUNDER_WAVE,   \
	     THUNDERBOLT,    FLAMETHROWER,   FLY,            SURF,           STRENGTH 
	; end

	db BANK(GyaradosPicFront)
