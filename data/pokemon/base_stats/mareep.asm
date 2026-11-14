	db DEX_MAREEP ; pokedex id

	db  55, 40,  40,  35,  65,  45
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 235 ; catch rate
	db 56 ; base exp

	INCBIN "gfx/pokemon/gsfront/mareep.pic", 0, 1 ; sprite dimensions
	dw MareepPicFront, MareepPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,          POWER_GEM,      TRAILBLAZE,     SIGNAL_BEAM,    ENERGY_BALL,    \
	     AURA_WHEEL,     DIG,            THUNDER_WAVE,   THUNDERBOLT,    MOONBLAST,      \
		 FLASH
	; end

	db BANK(MareepPicFront)
