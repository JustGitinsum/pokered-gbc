	db DEX_ELECTIVIRE ; pokedex id

	db  75, 123,  67, 95,  95,  85
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 243 ; base exp

	INCBIN "gfx/pokemon/gsfront/electivire.pic", 0, 1 ; sprite dimensions
	dw ElectivirePicFront, ElectivirePicBack

	db QUICK_ATTACK, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TOXIC,          POWER_GEM,      TRAILBLAZE,     \
	     HYPER_BEAM,     POISON_JAB,     SIGNAL_BEAM,    MIGHTY_CLEAVE,  THUNDERFANG,    \
		 AURA_WHEEL,     PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      \
		 ACCELEROCK,     FLASH_CANNON,   THUNDERPUNCH,   FIRE_PUNCH,     THUNDER_WAVE,   \
	     AURA_SPHERE,    THUNDERBOLT,    STRENGTH,       FLASH 
	; end

	db BANK(ElectivirePicFront)
