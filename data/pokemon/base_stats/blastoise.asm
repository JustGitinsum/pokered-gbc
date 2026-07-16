	db DEX_BLASTOISE ; pokedex id

	db  79,  83, 100,  78,  85
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 210 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/blastoise.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/blastoise.pic", 0, 1 ; sprite dimensions
ENDC
	dw BlastoisePicFront, BlastoisePicBack

	db TACKLE, TAIL_WHIP, BUBBLE, WATER_GUN ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm AURORA_BEAM,    DRAGONBREATH,   CLOSE_COMBAT,   TOXIC,          BUBBLEBEAM,     \
	     TRAILBLAZE,     ICE_BEAM,       DRAGON_PULSE,   HYPER_BEAM,     POISON_JAB,     \
		 WATERFALL,      MIGHTY_CLEAVE,  EARTHQUAKE,     EARTH_POWER,    DIG,            \
		 DARK_PULSE,     ICE_PUNCH,      GLACIAL_LANCE,  ACCELEROCK,     FLASH_CANNON,   \
	     ICE_FANG,       AURA_SPHERE,    SURF,           STRENGTH 
	; end

	db BANK(BlastoisePicFront)
