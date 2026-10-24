; To add a player character:
; 1. Add a PLAYER_* constant in constants/misc_constants.asm.
; 2. Add a player_character entry below (in the same order) and its default names.
; 3. Add its graphics to gfx/player_characters.asm:
;    <Name>PicFront (56x56), <Name>PicBack (48x48), <Name>Sprite and <Name>BikeSprite.
;    Female front pics must leave their rightmost 8 pixels blank.
; 4. Add its fishing tiles to gfx/fishing.asm and PlayerFishingTiles
;    in engine/overworld/player_animations.asm.
; Characters of the same gender are scrolled through with LEFT/RIGHT on the
; BOY/GIRL menu, in table order. The first one of each gender is the default.

IF DEF(_BLUE)
DEF PAL_VERSION_CARD EQU PAL_BLUEMON
ELSE
DEF PAL_VERSION_CARD EQU PAL_REDMON
ENDC

MACRO player_character
; \1 = graphics label prefix, \2 = gender, \3 = pic palette,
; \4 = overworld sprite palette, \5 = trainer card border palette,
; \6 = default names
	db \2
IF GEN_2_GRAPHICS
	db \3
ELSE
	db PAL_REDMON
ENDC
	db \4, \5
	dw \6
	dba \1PicFront, \1PicBack, \1Sprite, \1BikeSprite
ENDM

PlayerCharacters:
	table_width PLAYER_CHAR_LENGTH
	player_character Red,   PLAYER_MALE,   PAL_HERO,  SPR_PAL_ORANGE, PAL_VERSION_CARD, RedDefaultNames   ; PLAYER_RED
	player_character Green, PLAYER_FEMALE, PAL_ERIKA, SPR_PAL_GREEN,  PAL_GREENMON,     GreenDefaultNames ; PLAYER_GREEN
	player_character Gold,  PLAYER_MALE,   PAL_ENGINEER,  SPR_PAL_ORANGE, PAL_VERSION_CARD, GoldDefaultNames   ; PLAYER_GOLD
	player_character Kris,  PLAYER_FEMALE, PAL_BEAUTY, SPR_PAL_BLUE,  PAL_BLUEMON,     KrisDefaultNames ; PLAYER_KRIS
	player_character Hilda, PLAYER_FEMALE, PAL_LASS, SPR_PAL_BLUE, PAL_BLUEMON, HildaDefaultNames ; PLAYER_HILDA
	assert_table_length NUM_PLAYER_CHARACTERS

; Exactly NUM_PLAYER_DEFAULT_NAMES names each, up to 7 characters each
DEF NUM_PLAYER_DEFAULT_NAMES EQU 3

RedDefaultNames:
	db   "Red"
	next "Ash"
	next "Justin@"

GreenDefaultNames:
	db   "Green"
	next "Leaf"
	next "Jess@"

GoldDefaultNames:
	db   "Gold"
	next "Ethan"
	next "Adam@"

KrisDefaultNames:
	db   "Kris"
	next "Lyra"
	next "Daisy@"

HildaDefaultNames:
	db   "Hilda"
	next "White"
	next "Rosa@"