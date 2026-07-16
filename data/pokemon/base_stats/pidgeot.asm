	db DEX_PIDGEOT ; pokedex id

	db  83,  80,  75,  91,  70
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 172 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/pidgeot.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/pidgeot.pic", 0, 1 ; sprite dimensions
ENDC
	dw PidgeotPicFront, PidgeotPicBack

	db GUST, SAND_ATTACK, QUICK_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      CLOSE_COMBAT,   TOXIC,          HYPER_BEAM,     \
	     MIGHTY_CLEAVE,  ACCELEROCK,     STEEL_WING,     CUT,            FLY 
	; end

	db BANK(PidgeotPicFront)
