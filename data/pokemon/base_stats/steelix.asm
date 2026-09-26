	db DEX_STEELIX ; pokedex id

	db  75,  85, 200,  30,  65
	;   hp  atk  def  spd  spc

	db STEEL, GROUND ; type
	db 45 ; catch rate
	db 179 ; base exp

	INCBIN "gfx/pokemon/gsfront/steelix.pic", 0, 1 ; sprite dimensions
	dw SteelixPicFront, SteelixPicBack

	db TACKLE, HARDEN, ROCK_TOMB, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          POWER_GEM,      DRAGON_PULSE,   \
	     HYPER_BEAM,     ANCIENTPOWER,   MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    \
		 DIG,            ACCELEROCK,     FLASH_CANNON,   STRENGTH 
	; end

	db BANK(SteelixPicFront)
