	db DEX_CHANSEY ; pokedex id

	db 250,   5,   5,  50, 105
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 30 ; catch rate
	db 255 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/chansey.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/chansey.pic", 0, 1 ; sprite dimensions
ENDC
	dw ChanseyPicFront, ChanseyPicBack

	db POUND, DOUBLESLAP, DEFENSE_CURL, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    TOXIC,          BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       \
	     HYPER_BEAM,     POISON_JAB,     ANCIENTPOWER,   ENERGY_BALL,    AURA_WHEEL,     \
	     EARTHQUAKE,     EARTH_POWER,    PSYCHIC_M,      PSYBEAM,        ICE_PUNCH,      \
		 ACCELEROCK,     THUNDERPUNCH,   HEAT_CRASH,     FIRE_PUNCH,     SHADOW_BALL,    \
		 THUNDER_WAVE,   THUNDERBOLT,    FLAMETHROWER,   MOONBLAST,      FLASH 
	; end

	db BANK(ChanseyPicFront)
