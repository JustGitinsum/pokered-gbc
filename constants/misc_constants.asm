; Boolean checks
DEF FALSE EQU 0
DEF TRUE  EQU 1

; flag operations
	const_def
	const FLAG_RESET ; 0
	const FLAG_SET   ; 1
	const FLAG_TEST  ; 2

; input
DEF NO_INPUT EQU 0

; wPlayerGender values (player character); see data/player_characters.asm
	const_def
	const PLAYER_RED   ; 0
	const PLAYER_GREEN ; 1
	const PLAYER_GOLD  ; 2
	const PLAYER_KRIS  ; 3
	const PLAYER_HILDA ; 4
DEF NUM_PLAYER_CHARACTERS EQU const_value

; PlayerCharacters genders
	const_def
	const PLAYER_MALE   ; 0
	const PLAYER_FEMALE ; 1

; PlayerCharacters entry layout
DEF PLAYER_CHAR_GENDER      EQU 0
DEF PLAYER_CHAR_PIC_PAL     EQU 1 ; front/back pic palette (PAL_*)
DEF PLAYER_CHAR_SPRITE_PAL  EQU 2 ; overworld sprite palette (SPR_PAL_*)
DEF PLAYER_CHAR_CARD_PAL    EQU 3 ; trainer card border palette (PAL_*)
DEF PLAYER_CHAR_NAMES       EQU 4 ; pointer to default names
DEF PLAYER_CHAR_GFX         EQU 6 ; PLAYER_GFX_* pointers (dba each)

; GetPlayerGfx graphics types
	const_def
	const PLAYER_GFX_FRONT ; 0
	const PLAYER_GFX_BACK  ; 1
	const PLAYER_GFX_WALK  ; 2
	const PLAYER_GFX_BIKE  ; 3
DEF NUM_PLAYER_GFX EQU const_value

DEF PLAYER_CHAR_LENGTH EQU PLAYER_CHAR_GFX + 3 * NUM_PLAYER_GFX
