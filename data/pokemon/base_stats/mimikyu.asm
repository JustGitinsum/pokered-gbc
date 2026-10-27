	db DEX_MIMIKYU ; pokedex id

	db  55,  90,  80,  96,  105
	;   hp  atk  def  spd  spc

	db GHOST, FAIRY ; type
	db 145 ; catch rate
	db 167 ; base exp

	INCBIN "gfx/pokemon/gsfront/mimikyu.pic", 0, 1 ; sprite dimensions
	dw MimikyuPicFront, MimikyuPicBack

	db SCRATCH, SCREECH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm X_SCISSOR,      TRAILBLAZE,     HYPER_BEAM,     GIGA_DRAIN,     AURA_WHEEL,     \
	     PSYCHIC_M,      PSYBEAM,        DARK_PULSE,     SHADOW_CLAW,    SHADOW_BALL,    \
		 THUNDER_WAVE,   THUNDERBOLT,    MOONBLAST,      FLASH
	; end

	db BANK(MimikyuPicFront)
