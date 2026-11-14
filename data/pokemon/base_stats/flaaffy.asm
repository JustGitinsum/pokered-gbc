	db DEX_FLAAFFY ; pokedex id

	db  70,  55, 55,  45,  80,  60
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 120 ; catch rate
	db 128 ; base exp

	INCBIN "gfx/pokemon/gsfront/flaaffy.pic", 0, 1 ; sprite dimensions
	dw FlaaffyPicFront, FlaaffyPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,          POWER_GEM,      TRAILBLAZE,     SIGNAL_BEAM,    ENERGY_BALL,    \
	     AURA_WHEEL,     DIG,            ICE_PUNCH,      THUNDERPUNCH,   FIRE_PUNCH,     \
		 THUNDER_WAVE,   THUNDERBOLT,    MOONBLAST,      STRENGTH,       FLASH
	; end

	db BANK(FlaaffyPicFront)
