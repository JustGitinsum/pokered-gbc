	db DEX_EEVEE ; pokedex id

	db  55,  55,  50,  55,  65
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 92 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/eevee.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/eevee.pic", 0, 1 ; sprite dimensions
ENDC
	dw EeveePicFront, EeveePicBack

	db TACKLE, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     CLOSE_COMBAT,   TOXIC,          SLUDGE_BOMB,    TRAILBLAZE,     \
	     HYPER_BEAM,     POISON_JAB,     SIGNAL_BEAM,    DIG,            ACCELEROCK,     \
		 SHADOW_BALL,    CUT,            STRENGTH,       FLASH 
	; end

	db BANK(EeveePicFront)
