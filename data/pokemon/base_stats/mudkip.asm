	db DEX_MUDKIP ; pokedex id

	db  50,  70,  50,  40,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 180 ; catch rate
	db 62 ; base exp

	INCBIN "gfx/pokemon/gsfront/mudkip.pic", 0, 1 ; sprite dimensions
	dw MudkipPicFront, MudkipPicBack

	db TACKLE, GROWL, BITE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          SLUDGE_BOMB,    \
	     BUBBLEBEAM,     ICE_BEAM,       WATERFALL,      ANCIENTPOWER,   \
		 MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    DIG,            \
		 SURF,           STRENGTH
	; end

	db BANK(MudkipPicFront)
