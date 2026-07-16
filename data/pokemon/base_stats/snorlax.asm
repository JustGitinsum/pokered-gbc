	db DEX_SNORLAX ; pokedex id

	db 160, 110,  65,  30,  65
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 25 ; catch rate
	db 154 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/snorlax.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/snorlax.pic", 0, 1 ; sprite dimensions
ENDC
	dw SnorlaxPicFront, SnorlaxPicBack

	db BITE, DEFENSE_CURL, LICK, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          BUBBLEBEAM,     TRAILBLAZE,     \
	     ICE_BEAM,       HYPER_BEAM,     POISON_JAB,     WATERFALL,      MIGHTY_CLEAVE,  \
		 AURA_WHEEL,     EARTHQUAKE,     EARTH_POWER,    DIG,            PSYCHIC_M,      \
		 PSYBEAM,        ICE_PUNCH,      GLACIAL_LANCE,  ACCELEROCK,     THUNDERPUNCH,   \
		 HEAT_CRASH,     FIRE_PUNCH,     SHADOW_BALL,    THUNDERBOLT,    FLAMETHROWER,   \
		 SURF,           STRENGTH 
	; end

	db BANK(SnorlaxPicFront)
