	db DEX_TAUROS ; pokedex id

	db  75, 100,  95, 110,  70
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 211 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/tauros.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/tauros.pic", 0, 1 ; sprite dimensions
ENDC
	dw TaurosPicFront, TaurosPicBack

	db TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          POWER_GEM,      \
	     TRAILBLAZE,     ICE_BEAM,       HYPER_BEAM,     POISON_JAB,     MIGHTY_CLEAVE,  \
		 AURA_WHEEL,     EARTHQUAKE,     DIG,            GLACIAL_LANCE,  ACCELEROCK,     \
		 HEAT_CRASH,     SHADOW_BALL,    THUNDERBOLT,    FLAMETHROWER,   CUT,            \
		 SURF,           STRENGTH 
	; end

	db BANK(TaurosPicFront)
