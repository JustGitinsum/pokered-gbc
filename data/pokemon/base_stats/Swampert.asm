	db DEX_SWAMPERT ; pokedex id

	db  100, 110, 90,  60,  85,  90
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db 45 ; catch rate
	db 210 ; base exp

	INCBIN "gfx/pokemon/gsfront/swampert.pic", 0, 1 ; sprite dimensions
	dw SwampertPicFront, SwampertPicBack

	db TACKLE, GROWL, BITE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          POWER_GEM,      SLUDGE_BOMB,    \
	     BUBBLEBEAM,     ICE_BEAM,       HYPER_BEAM,     POISON_JAB,     WATERFALL,      \
		 ANCIENTPOWER,   MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    DIG,            \
		 ICE_PUNCH,      GLACIAL_LANCE,  SURF,           STRENGTH
	; end

	db BANK(SwampertPicFront)
