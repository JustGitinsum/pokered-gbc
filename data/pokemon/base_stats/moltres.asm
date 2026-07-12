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

	db WING_ATTACK, FLAMETHROWER, DRAGONBREATH, AGILITY ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm AERIAL_ACE,     AIR_SLASH,      AURORA_BEAM,    DRAGONBREATH,   CLOSE_COMBAT,   \
	     TOXIC,          X_SCISSOR,      FIRE_FANG,      POWER_GEM,      SLUDGE_BOMB,    \
	     BUBBLEBEAM,     TRAILBLAZE,     ICE_BEAM,       DRAGON_PULSE,   HYPER_BEAM,     \
	     SPORE,          POISON_JAB,     WATERFALL,      ANCIENTPOWER,   SIGNAL_BEAM,    \
	     GIGA_DRAIN,     ENERGY_BALL,    MIGHTY_CLEAVE,  THUNDERFANG,    AURA_WHEEL,     \
	     EARTHQUAKE,     EARTH_POWER,    DIG,            PSYCHIC_M,      PSYBEAM,        \
	     DARK_PULSE,     ICE_PUNCH,      GLACIAL_LANCE,  ACCELEROCK,     FLASH_CANNON,   \
	     LEAF_BLADE,     THUNDERPUNCH,   HEAT_CRASH,     STEEL_WING,     FIRE_PUNCH,     \
	     SHADOW_CLAW,    SHADOW_BALL,    DRAGON_CLAW,    ICE_FANG,       THUNDER_WAVE,   \
	     PSYCHO_CUT,     AURA_SPHERE,    THUNDERBOLT,    FLAMETHROWER,   MOONBLAST,      \
	     CUT,            FLY,            SURF,           STRENGTH,       FLASH,          \
	; end

	db BANK(MoltresPicFront)
