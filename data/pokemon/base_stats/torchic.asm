	db DEX_TORCHIC ; pokedex id

	db  45,  60,  40,  45,  70,  50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 180 ; catch rate
	db 65 ; base exp

	INCBIN "gfx/pokemon/gsfront/torchic.pic", 0, 1 ; sprite dimensions
	dw TorchicPicFront, TorchicPicBack

	db PECK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      TOXIC,          TRAILBLAZE,     \
	     DIG,            ACCELEROCK,     STEEL_WING,     SHADOW_CLAW,    \
		 FLAMETHROWER,   CUT,            STRENGTH,       FLASH
	; end

	db BANK(TorchicPicFront)
