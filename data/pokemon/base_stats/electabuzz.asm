	db DEX_ELECTABUZZ ; pokedex id

	db  65,  83,  57, 105,  85
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 156 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/electabuzz.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/electabuzz.pic", 0, 1 ; sprite dimensions
ENDC
	dw ElectabuzzPicFront, ElectabuzzPicBack

	db QUICK_ATTACK, LEER, THUNDERSHOCK, SWIFT ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TOXIC,          POWER_GEM,      TRAILBLAZE,     \
	     HYPER_BEAM,     POISON_JAB,     SIGNAL_BEAM,    MIGHTY_CLEAVE,  THUNDERFANG,    \
		 AURA_WHEEL,     PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      \
		 ACCELEROCK,     FLASH_CANNON,   THUNDERPUNCH,   FIRE_PUNCH,     THUNDER_WAVE,   \
	     AURA_SPHERE,    THUNDERBOLT,    STRENGTH,       FLASH 
	; end

	db BANK(ElectabuzzPicFront)
