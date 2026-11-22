	db DEX_LATIOS ; pokedex id

	db  80, 90,  80, 110,  130, 110
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, PSYCHIC_TYPE ; type
	db 3 ; catch rate
	db 250 ; base exp

	INCBIN "gfx/pokemon/gsfront/latios.pic", 0, 1 ; sprite dimensions
	dw LatiosPicFront, LatiosPicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      AURORA_BEAM,    DRAGONBREATH,   TOXIC,          \
	     BUBBLEBEAM,     ICE_BEAM,       DRAGON_PULSE,   HYPER_BEAM,     WATERFALL,      \
		 ANCIENTPOWER,   ENERGY_BALL,    AURA_WHEEL,     EARTHQUAKE,     EARTH_POWER,    \
		 PSYCHIC_M,      PSYBEAM,        ACCELEROCK,     STEEL_WING,     SHADOW_CLAW,    \
		 SHADOW_BALL,    DRAGON_CLAW,    THUNDER_WAVE,   AURA_SPHERE,    THUNDERBOLT,    \
		 FLAMETHROWER,   MOONBLAST,      CUT,            FLY,            SURF,           \
		 FLASH
	; end

	db BANK(LatiosPicFront)
