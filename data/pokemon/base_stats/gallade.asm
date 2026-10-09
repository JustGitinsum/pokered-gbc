	db DEX_GALLADE ; pokedex id

	db  68,  125, 65, 80, 65
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, FIGHTING ; type
	db 50 ; catch rate
	db 230 ; base exp

	INCBIN "gfx/pokemon/gsfront/gallade.pic", 0, 1 ; sprite dimensions
	dw GalladePicFront, GalladePicBack

	db SLASH, POUND, LEER, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

; tm/hm learnset
	tmhm AERIAL_ACE,     AURORA_BEAM,    CLOSE_COMBAT,   X_SCISSOR,      POWER_GEM,      \
	     TRAILBLAZE,     ICE_BEAM,       HYPER_BEAM,     ANCIENTPOWER,   ENERGY_BALL,    \
		 MIGHTY_CLEAVE,  AURA_WHEEL,     EARTHQUAKE,     PSYCHIC_M,      PSYBEAM,        \
	     ICE_PUNCH,      GLACIAL_LANCE,  LEAF_BLADE,     THUNDERPUNCH,   SHADOW_CLAW,    \
		 SHADOW_BALL,    THUNDER_WAVE,   PSYCHO_CUT,     THUNDERBOLT,    MOONBLAST,      \
	     CUT,            STRENGTH,       FLASH
	; end

	db BANK(GalladePicFront)
