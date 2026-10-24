	db DEX_AURORUS ; pokedex id

	db 123,  77,  72,  58,  99
	;   hp  atk  def  spd  spc

	db ROCK, ICE ; type
	db 145 ; catch rate
	db 104 ; base exp

	INCBIN "gfx/pokemon/gsfront/aurorus.pic", 0, 1 ; sprite dimensions
	dw AurorusPicFront, AurorusPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

; tm/hm learnset
	tmhm AURORA_BEAM,    DRAGONBREATH,   TRAILBLAZE,     ICE_BEAM,       DRAGON_PULSE,   \
	     HYPER_BEAM,     ANCIENTPOWER,   SIGNAL_BEAM,    MIGHTY_CLEAVE,  EARTHQUAKE,     \
		 EARTH_POWER,    PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     GLACIAL_LANCE,  \
		 ACCELEROCK,     FLASH_CANNON,   THUNDERPUNCH,   THUNDER_WAVE,   THUNDERBOLT,    \
		 MOONBLAST,      STRENGTH,       FLASH
	; end

	db BANK(AurorusPicFront)
