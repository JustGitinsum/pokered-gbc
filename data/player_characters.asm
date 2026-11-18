; To add a player character:
; 1. Append a PLAYER_* constant in constants/misc_constants.asm.
; 2. Add a player_character entry below, its default names, and an entry in
;    GetPlayerCharacterEntry's index table in engine/player_characters.asm.
; 3. Add its graphics to gfx/player_characters.asm:
;    <Name>PicFront (56x56), <Name>PicBack (48x48), <Name>Sprite and <Name>BikeSprite.
; 4. Add its fishing tiles to gfx/fishing.asm and PlayerFishingTiles
;    in engine/overworld/player_animations.asm.
; Characters of the same gender are scrolled through with LEFT/RIGHT on the
; BOY/GIRL menu, in PLAYER_* order. The first one of each gender is the default.

IF DEF(_BLUE)
DEF PAL_VERSION_CARD EQU PAL_BLUEMON
ELSE
DEF PAL_VERSION_CARD EQU PAL_REDMON
ENDC

MACRO player_character
; \1 = graphics label prefix, \2 = gender, \3 = pic palette,
; \4 = overworld sprite palette, \5 = trainer card border palette,
; \6 = default names
PlayerCharacter\1:
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
	player_character Red,     PLAYER_MALE,    PAL_HERO,     SPR_PAL_ORANGE,  PAL_VERSION_CARD, RedDefaultNames     ; PLAYER_RED
	player_character Gold,    PLAYER_MALE,    PAL_HERO,     SPR_PAL_ORANGE,  PAL_VERSION_CARD, GoldDefaultNames    ; PLAYER_GOLD
	player_character Brendan, PLAYER_MALE,    PAL_ERIKA,    SPR_PAL_GREEN,   PAL_GREENMON,     BrendanDefaultNames ; PLAYER_BRENDAN
	player_character Green,   PLAYER_FEMALE,  PAL_ERIKA,    SPR_PAL_GREEN,   PAL_GREENMON,     GreenDefaultNames   ; PLAYER_GREEN
	player_character Lyra,    PLAYER_FEMALE,  PAL_HERO,     SPR_PAL_ORANGE,  PAL_BLUEMON,      LyraDefaultNames    ; PLAYER_LYRA
	player_character Hilda,   PLAYER_FEMALE,  PAL_SWIMMER,  SPR_PAL_PURPLE,  PAL_PURPLEMON,    HildaDefaultNames   ; PLAYER_HILDA
	player_character Rosa,    PLAYER_FEMALE,  PAL_BEAUTY,   SPR_PAL_BLUE,    PAL_PINKMON,      RosaDefaultNames    ; PLAYER_ROSA
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
	next "Kyle@"

LyraDefaultNames:
	db   "Lyra"
	next "Crystal"
	next "Lily@"

HildaDefaultNames:
	db   "Hilda"
	next "White"
	next "Toko@"

RosaDefaultNames:
	db   "Rosa"
	next "White"
	next "Mei@"

BrendanDefaultNames:
	db   "Brendan"
	next "Ruby"
	next "Adam@"
