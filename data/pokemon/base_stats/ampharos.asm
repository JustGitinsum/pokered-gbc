	db DEX_AMPHAROS ; pokedex id

	db  90, 75,  85,  55,  115, 90
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, DRAGON ; type
	db 45 ; catch rate
	db 255 ; base exp

	INCBIN "gfx/pokemon/gsfront/ampharos.pic", 0, 1 ; sprite dimensions
	dw AmpharosPicFront, AmpharosPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          POWER_GEM,      TRAILBLAZE,     \
	     DRAGON_PULSE,   HYPER_BEAM,     SIGNAL_BEAM,    ENERGY_BALL,    AURA_WHEEL,     \
	     DIG,            ICE_PUNCH,      THUNDERPUNCH,   FIRE_PUNCH,     DRAGON_CLAW,    \
		 THUNDER_WAVE,   AURA_SPHERE,    THUNDERBOLT,    MOONBLAST,      STRENGTH,       \
		 FLASH
	; end

	db BANK(AmpharosPicFront)
