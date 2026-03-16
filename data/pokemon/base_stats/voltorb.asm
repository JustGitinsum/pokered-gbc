	db DEX_VOLTORB ; pokedex id

	db  40,  30,  50, 100,  55
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 103 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/voltorb.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/voltorb.pic", 0, 1 ; sprite dimensions
ENDC
	dw VoltorbPicFront, VoltorbPicBack

	db TACKLE, LIGHT_SCREEN, SONICBOOM, THUNDERSHOCK ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    RAGE,         THUNDERFANG,  THUNDER,      \
	     BRICK_BREAK,     MIMIC,        ICE_PUNCH,  REFLECT,      ACCELEROCK,         \
	     LEAF_BLADE, STEEL_WING,        ICE_FANG,         THUNDER_WAVE, AURA_SPHERE,    \
	     SUBSTITUTE,   FLASH
	; end

	db BANK(VoltorbPicFront)
