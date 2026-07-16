	db DEX_PIKACHU ; pokedex id

	db  35,  55,  30,  90,  50
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 82 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/pikachu.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/pikachu.pic", 0, 1 ; sprite dimensions
ENDC
	dw PikachuPicFront, PikachuPicBack

	db THUNDERSHOCK, GROWL, QUICK_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          TRAILBLAZE,     \
	     HYPER_BEAM,     POISON_JAB,     THUNDERFANG,    AURA_WHEEL,     DIG,            \
		 ACCELEROCK,     FLASH_CANNON,   THUNDERPUNCH,   THUNDER_WAVE,   THUNDERBOLT,    \
		 CUT,            SURF,           STRENGTH,       FLASH 
	; end

	db BANK(PikachuPicFront)
