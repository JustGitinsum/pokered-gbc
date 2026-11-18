; BOY/GIRL selection at the start of a new game.
; UP/DOWN chooses the gender; LEFT/RIGHT scrolls through the player
; characters of that gender in PLAYER_* order (see data/player_characters.asm).
; The previewed character is stored in wPlayerGender when A is pressed.

; wStringBuffer is free here and holds the character picked for each gender
DEF wPlayerSelectBoy  EQUS "wStringBuffer"
DEF wPlayerSelectGirl EQUS "(wStringBuffer + 1)"

; top-left corner of the 7x7 front pic
DEF PLAYER_SELECT_PIC_X EQU 4
DEF PLAYER_SELECT_PIC_Y EQU 4

BoyGirlChoice::
	hlcoord 13, 7
	lb bc, 3, 5
	call TextBoxBorder
	hlcoord 15, 8
	ld de, BoyGirlMenuText
	call PlaceString
	ld a, PAD_A | PAD_UP | PAD_DOWN | PAD_LEFT | PAD_RIGHT
	ld [wMenuWatchedKeys], a
	ld a, 1
	ld [wMaxMenuItem], a
	ld a, 8
	ld [wTopMenuItemY], a
	ld a, 14
	ld [wTopMenuItemX], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuWatchMovingOutOfBounds], a
	ld [wSpriteFlipped], a
	ld a, PLAYER_MALE
	call GetFirstPlayerCharacter
	ld [wPlayerSelectBoy], a
	ld a, PLAYER_FEMALE
	call GetFirstPlayerCharacter
	ld [wPlayerSelectGirl], a
	ld a, [wPlayerSelectBoy]
	call LoadPlayerSelectPic
	ld a, [wPlayerSelectBoy]
	call ShowPlayerSelectPic
.loop
	call HandleMenuInput
	bit B_PAD_A, a
	jr nz, .done
	ld c, 1
	bit B_PAD_RIGHT, a
	jr nz, .scroll
	ld c, -1
	bit B_PAD_LEFT, a
	jr nz, .scroll
	call GetPlayerSelectCharacter
	ld a, [hl]
	ld hl, wPlayerGender
	cp [hl]
	jr z, .loop
	jr .loadAndShow

.scroll
	call GetPlayerSelectCharacter
	ld a, [hl]
	push hl
	call GetNextPlayerCharacter
	pop hl
	cp [hl]
	jr z, .loop ; no other character of this gender
	ld [hl], a
	push af
	ld a, SFX_PRESS_AB
	call PlaySound
	pop af
.loadAndShow
	push af
	; hide the old pic while the new one is decompressed into its slot
	hlcoord PLAYER_SELECT_PIC_X, PLAYER_SELECT_PIC_Y
	lb bc, 7, 7
	call ClearScreenArea
	pop af
	push af
	call LoadPlayerSelectPic
	pop af
	call ShowPlayerSelectPic
	jr .loop

.done
	call GetPlayerSelectCharacter
	ld a, [hl]
	ld [wPlayerGender], a
	ret

; returns hl = wPlayerSelectBoy or wPlayerSelectGirl for the cursor position
GetPlayerSelectCharacter:
	ld a, [wCurrentMenuItem]
	ld hl, wPlayerSelectBoy
	and a
	ret z
	inc hl
	ret

; a = PLAYER_* constant; decompresses its front pic into vFrontPic
LoadPlayerSelectPic:
	ld e, PLAYER_GFX_FRONT
	call GetPlayerGfxForCharacter
	ld a, h
	call UncompressSpriteFromDE
	ld hl, sSpriteBuffer1
	ld de, sSpriteBuffer0
	ld bc, $310
	call CopyData
	ld de, vFrontPic
	jp InterlaceMergeSpriteBuffers

; a = PLAYER_* constant; draws its preloaded pic and loads its palette
ShowPlayerSelectPic:
	ld [wPlayerGender], a
	xor a ; first tile of vFrontPic
	ldh [hStartTileID], a
	hlcoord PLAYER_SELECT_PIC_X, PLAYER_SELECT_PIC_Y
	predef CopyUncompressedPicToTilemap
	call DrawPlayerSelectArrows
	farcall SetPal_OakIntro
	call GetPlayerPalettes
	ld e, 0
	ld a, 2
	ldh [rWBK], a
	CALL_INDIRECT LoadSGBPalette
	; there's no screen fade here, so force the GBC palettes to refresh
	ld a, 1
	ld [W2_ForceBGPUpdate], a
	xor a
	ldh [rWBK], a
	ld e, TRAINER_PIC_SELECTION
	farjp SetPal_PlayerFrontPic

; draws ◀ ▶ beside the pic if LEFT/RIGHT can change the shown character
DrawPlayerSelectArrows:
	ld a, [wPlayerGender]
	ld c, 1
	call GetNextPlayerCharacter
	ld hl, wPlayerGender
	cp [hl]
	lb bc, "◀", "▶"
	jr nz, .draw
	lb bc, " ", " "
.draw
	hlcoord PLAYER_SELECT_PIC_X - 1, PLAYER_SELECT_PIC_Y + 3
	ld [hl], b
	hlcoord PLAYER_SELECT_PIC_X + 7, PLAYER_SELECT_PIC_Y + 3
	ld [hl], c
	ret

BoyGirlMenuText:
	db   "BOY"
	next "GIRL@"
