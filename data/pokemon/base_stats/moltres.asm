	db DEX_MOLTRES ; pokedex id

	db  90, 100,  90,  90, 125
	;   hp  atk  def  spd  spc

	db FIRE, FLYING ; type
	db 3 ; catch rate
	db 217 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/moltres.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/moltres.pic", 0, 1 ; sprite dimensions
ENDC
	dw MoltresPicFront, MoltresPicBack

	db WING_ATTACK, FLAMETHROWER, ANCIENTPOWER, AGILITY ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      TOXIC,          POWER_GEM,      HYPER_BEAM,     \
	     ANCIENTPOWER,   SIGNAL_BEAM,    ENERGY_BALL,    HEAT_CRASH,     STEEL_WING,     \
	     FLAMETHROWER,   MOONBLAST,      FLY,            FLASH 
	; end

	db BANK(MoltresPicFront)
