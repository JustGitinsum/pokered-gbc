	db DEX_BLAZIKEN ; pokedex id

	db  80, 120,  70,  80, 110,  70
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIGHTING ; type
	db 45 ; catch rate
	db 239 ; base exp

	INCBIN "gfx/pokemon/gsfront/blaziken.pic", 0, 1 ; sprite dimensions
	dw BlazikenPicFront, BlazikenPicBack

	db PECK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          \
	     TRAILBLAZE,     HYPER_BEAM,     POISON_JAB,     ENERGY_BALL,    \
		 MIGHTY_CLEAVE,  AURA_WHEEL,     EARTHQUAKE,     EARTH_POWER,    \
		 DIG,            ACCELEROCK,     THUNDERPUNCH,   HEAT_CRASH,     \
		 STEEL_WING,     FIRE_PUNCH,     SHADOW_CLAW,    AURA_SPHERE,    \
		 FLAMETHROWER,   CUT,            STRENGTH,       FLASH
	; end

	db BANK(BlazikenPicFront)
