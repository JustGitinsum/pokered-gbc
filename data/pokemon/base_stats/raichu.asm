	db DEX_RAICHU ; pokedex id

	db  60,  90,  55, 100,  90
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 75 ; catch rate
	db 122 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/raichu.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/raichu.pic", 0, 1 ; sprite dimensions
ENDC
	dw RaichuPicFront, RaichuPicBack

	db THUNDERSHOCK, GROWL, THUNDER_WAVE, QUICK_ATTACK ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          TRAILBLAZE,     \
	     HYPER_BEAM,     POISON_JAB,     THUNDERFANG,    AURA_WHEEL,     DIG,            \
		 ACCELEROCK,     FLASH_CANNON,   THUNDERPUNCH,   THUNDER_WAVE,   THUNDERBOLT,    \
		 CUT,            SURF,           STRENGTH,       FLASH 
	; end

	db BANK(RaichuPicFront)
