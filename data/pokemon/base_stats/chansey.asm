	db DEX_CHANSEY ; pokedex id

	db 250,   5,   5,  50, 105
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 30 ; catch rate
	db 255 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/chansey.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/chansey.pic", 0, 1 ; sprite dimensions
ENDC
	dw ChanseyPicFront, ChanseyPicBack

	db POUND, DOUBLESLAP, DEFENSE_CURL, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

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

	db BANK(ChanseyPicFront)
