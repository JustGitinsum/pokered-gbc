	db DEX_MARSHTOMP ; pokedex id

	db  70,  85,  70,  50,  60,  70
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db 90 ; catch rate
	db 142 ; base exp

	INCBIN "gfx/pokemon/gsfront/marshtomp.pic", 0, 1 ; sprite dimensions
	dw MarshtompPicFront, MarshtompPicBack

	db TACKLE, GROWL, BITE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    CLOSE_COMBAT,   TOXIC,          POWER_GEM,      SLUDGE_BOMB,    \
	     BUBBLEBEAM,     ICE_BEAM,       POISON_JAB,     WATERFALL,      ANCIENTPOWER,   \
		 MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    DIG,            ICE_PUNCH,      \
		 GLACIAL_LANCE,  SURF,           STRENGTH
	; end

	db BANK(MarshtompPicFront)
