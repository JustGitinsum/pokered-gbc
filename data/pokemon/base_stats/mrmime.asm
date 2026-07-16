	db DEX_MR_MIME ; pokedex id

	db  40,  45,  65,  90, 100
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 136 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/mr.mime.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/mr.mime.pic", 0, 1 ; sprite dimensions
ENDC
	dw MrMimePicFront, MrMimePicBack

	db TACKLE, HYPNOSIS, CONFUSE_RAY, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          POWER_GEM,      \
	     TRAILBLAZE,     HYPER_BEAM,     ANCIENTPOWER,   SIGNAL_BEAM,    ENERGY_BALL,    \
		 AURA_WHEEL,     PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     ICE_PUNCH,      \
		 FLASH_CANNON,   THUNDERPUNCH,   FIRE_PUNCH,     SHADOW_BALL,    THUNDER_WAVE,   \
	     AURA_SPHERE,    THUNDERBOLT,    MOONBLAST,      STRENGTH,       FLASH 
	; end

	db BANK(MrMimePicFront)
