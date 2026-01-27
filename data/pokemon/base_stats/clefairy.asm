	db DEX_CLEFAIRY ; pokedex id

	db  70,  45,  48,  35,  60
	;   hp  atk  def  spd  spc

	db FAIRY, FAIRY ; type
	db 150 ; catch rate
	db 68 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/clefairy.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/clefairy.pic", 0, 1 ; sprite dimensions
ENDC
	dw ClefairyPicFront, ClefairyPicBack

	db POUND, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         SOLARBEAM,    \
	     THUNDERBOLT,  THUNDER,      PSYCHIC_M,    TELEPORT,     MIMIC,        \
	     ICE_PUNCH,  REFLECT,      BIDE,         METRONOME,    FIRE_BLAST,   \
	     FIRE_PUNCH,   REST,         THUNDER_WAVE, PSYWAVE,      FLAMETHROWER,   \
	     SUBSTITUTE,   STRENGTH,     FLASH
	; end

	db BANK(ClefairyPicFront)
