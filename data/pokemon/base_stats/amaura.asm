	db DEX_AMAURA ; pokedex id

	db  77,  59,  50,  46,  67
	;   hp  atk  def  spd  spc

	db ROCK, ICE ; type
	db 145 ; catch rate
	db 72 ; base exp

	INCBIN "gfx/pokemon/gsfront/amaura.pic", 0, 1 ; sprite dimensions
	dw AmauraPicFront, AmauraPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

; tm/hm learnset
	tmhm AURORA_BEAM,    DRAGONBREATH,   TRAILBLAZE,     ICE_BEAM,       DRAGON_PULSE,   \
	     ANCIENTPOWER,   SIGNAL_BEAM,    MIGHTY_CLEAVE,  EARTH_POWER,    GLACIAL_LANCE,  \
		 ACCELEROCK,     FLASH_CANNON,   THUNDER_WAVE,   FLASH
	; end

	db BANK(AmauraPicFront)
