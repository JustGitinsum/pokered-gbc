	db DEX_GRIMER ; pokedex id

	db  80,  80,  50,  25,  40
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 190 ; catch rate
	db 90 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/grimer.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/grimer.pic", 0, 1 ; sprite dimensions
ENDC
	dw GrimerPicFront, GrimerPicBack

	db POUND, POISON_GAS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CLOSE_COMBAT,   TOXIC,          SLUDGE_BOMB,    HYPER_BEAM,     POISON_JAB,     \
	     WATERFALL,      GIGA_DRAIN,     EARTHQUAKE,     EARTH_POWER,    DIG,            \
		 DARK_PULSE,     ICE_PUNCH,      THUNDERPUNCH,   FIRE_PUNCH,     SHADOW_BALL,    \
		 THUNDER_WAVE,   THUNDERBOLT,    FLAMETHROWER,   MOONBLAST,      STRENGTH 
	; end

	db BANK(GrimerPicFront)
