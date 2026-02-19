	db DEX_ELECTRODE ; pokedex id

	db  60,  50,  70, 140,  80
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 60 ; catch rate
	db 150 ; base exp

IF GEN_2_GRAPHICS
	INCBIN "gfx/pokemon/gsfront/electrode.pic", 0, 1 ; sprite dimensions
ELSE
	INCBIN "gfx/pokemon/front/electrode.pic", 0, 1 ; sprite dimensions
ENDC
	dw ElectrodePicFront, ElectrodePicBack

	db TACKLE, LIGHT_SCREEN, SONICBOOM, THUNDERSHOCK ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BULLDOZE,    HYPER_BEAM,   RAGE,         THUNDERFANG,  \
	     THUNDER,      TELEPORT,     MIMIC,        ICE_PUNCH,  REFLECT,      \
	     ACCELEROCK,         SELFDESTRUCT, SWIFT,        FIRE_PUNCH,   ICE_FANG,         \
	     THUNDER_WAVE, EXPLOSION,    SUBSTITUTE,   FLASH
	; end

	db BANK(ElectrodePicFront)
