AnimatePartyMon_ForceSpeed1:
	xor a
	ld [wCurrentMenuItem], a
	ld b, a
	inc a
	jr GetAnimationSpeed

; wPartyMenuHPBarColors contains the party mon's health bar colors
; 0: green
; 1: yellow
; 2: red
AnimatePartyMon::
	ld hl, wPartyMenuHPBarColors
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]

GetAnimationSpeed:
	ld c, a
	ld hl, PartyMonSpeeds
	add hl, bc
	ld a, [wOnSGB]
	xor $1
	add [hl]
	ld c, a
	add a
	ld b, a
	ld a, [wAnimCounter]
	and a
	jr z, .resetSprites
	cp c
	jr z, .animateSprite
.incTimer
	inc a
	cp b
	jr nz, .skipResetTimer
	xor a ; reset timer
.skipResetTimer
	ld [wAnimCounter], a
	jp DelayFrame
.resetSprites
	push bc
	ld hl, wMonPartySpritesSavedOAM
	ld de, wShadowOAM
	ld bc, $60
	call CopyData
	pop bc
	xor a
	jr .incTimer
.animateSprite
	push bc
	ld hl, wShadowOAMSprite00TileID
	ld bc, $10
	ld a, [wCurrentMenuItem]
	call AddNTimes
	; ld c, ICONOFFSET
; 	ld a, [hl]
; 	cp ICON_BALL << 2
; 	jr z, .editCoords
; 	cp ICON_HELIX << 2
; 	jr nz, .editTileIDS
; ; ICON_BALL and ICON_HELIX only shake up and down
; .editCoords
; 	dec hl
; 	dec hl ; dec hl to the OAM y coord
; 	ld c, $1 ; amount to increase the y coord by
; ; otherwise, load a second sprite frame
; .editTileIDS
	ld c, $2
	ld b, $4
	ld de, $4
.loop
	ld a, [hl]
	add c
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	pop bc
	ld a, c
	jr .incTimer

; Party mon animations cycle between 2 frames.
; The members of the PartyMonSpeeds array specify the number of V-blanks
; that each frame lasts for green HP, yellow HP, and red HP in order.
; On the naming screen, the yellow HP speed is always used.
PartyMonSpeeds:
	db 10, 24, 32

LoadMonPartySpriteGfx:
; Load mon party sprite tile patterns into VRAM during V-blank.
	ld hl, MonPartySpritePointers
	ld a, $1c

LoadAnimSpriteGfx:
; Load animated sprite tile patterns into VRAM during V-blank. hl is the address
; of an array of structures that contain arguments for CopyVideoData and a is
; the number of structures in the array.
	ld bc, $0
.loop
	push af
	push bc
	push hl
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyVideoData
	pop hl
	pop bc
	ld a, $6
	add c
	ld c, a
	pop af
	dec a
	jr nz, .loop
	ret

LoadMonPartySpriteGfxWithLCDDisabled:
; Load mon party sprite tile patterns into VRAM immediately by disabling the
; LCD.
	call DisableLCD
	ld hl, MonPartySpritePointers
	ld a, $1c
	ld bc, $0
.loop
	push af
	push bc
	push hl
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld a, [hli]
	ld c, a
	swap c
	ld b, $0
	ld a, [hli]
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	call FarCopyData2
	pop hl
	pop bc
	ld a, $6
	add c
	ld c, a
	pop af
	dec a
	jr nz, .loop
	jp EnableLCD

INCLUDE "data/icon_pointers.asm"

WriteMonPartySpriteOAMByPartyIndex:
; Write OAM blocks for the party mon in [hPartyMonIndex].
	push hl
	push de
	push bc
	ldh a, [hPartyMonIndex]
	ld hl, wPartySpecies
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	call GetPartyMonSpriteID
	ld [wOAMBaseTile], a
	call WriteMonPartySpriteOAM
	pop bc
	pop de
	pop hl
	ret

WriteMonPartySpriteOAMBySpecies:
; Write OAM blocks for the party sprite of the species in
; [wMonPartySpriteSpecies].
	xor a
	ldh [hPartyMonIndex], a
	ld a, [wMonPartySpriteSpecies]
	call GetPartyMonSpriteID
	ld [wOAMBaseTile], a
	jr WriteMonPartySpriteOAM

UnusedPartyMonSpriteFunction:
; This function is unused and doesn't appear to do anything useful. It looks
; like it may have been intended to load the tile patterns and OAM data for
; the mon party sprite associated with the species in [wCurPartySpecies].
; However, its calculations are off and it loads garbage data.
	ld a, [wCurPartySpecies]
	call GetPartyMonSpriteID
	push af
	ld hl, vSprites tile $00
	call .LoadTilePatterns
	pop af
	add $54
	ld hl, vSprites tile $04
	call .LoadTilePatterns
	xor a
	ld [wMonPartySpriteSpecies], a
	jr WriteMonPartySpriteOAMBySpecies

.LoadTilePatterns
	push hl
	add a
	ld c, a
	ld b, 0
	ld hl, MonPartySpritePointers
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	jp CopyVideoData

WriteMonPartySpriteOAM:
; Write the OAM blocks for the first animation frame into the OAM buffer and
; make a copy at wMonPartySpritesSavedOAM.
	push af
	ld c, $10
	ld h, HIGH(wShadowOAM)
	ldh a, [hPartyMonIndex]
	swap a
	ld l, a
	add $10
	ld b, a
	pop af
	cp ICON_HELIX << 2
	jr z, .helix
	call WriteSymmetricMonPartySpriteOAM
	jr .makeCopy
.helix
	call WriteAsymmetricMonPartySpriteOAM
; Make a copy of the OAM buffer with the first animation frame written so that
; we can flip back to it from the second frame by copying it back.
.makeCopy
	ld hl, wShadowOAM
	ld de, wMonPartySpritesSavedOAM
	ld bc, $60
	jp CopyData

GetPartyMonSpriteID:
	ld [wPokedexNum], a
	predef IndexToPokedex
	ld a, [wPokedexNum]
	ld c, a
	dec a
	srl a
	ld hl, MonPartyData
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	bit 0, c ; even or odd?
	jr nz, .skipSwap
	swap a ; use lower nybble if pokedex num is even
.skipSwap
	and $f0
	srl a ; value == ICON constant << 2
	srl a
	ret

INCLUDE "data/pokemon/menu_icons.asm"

DEF INC_FRAME_1 EQUS "0, $20"
DEF INC_FRAME_2 EQUS "$20, $20"

BugIconFrame1:       INCBIN "gfx/icons/bug.2bpp",       INC_FRAME_1
PlantIconFrame1:     INCBIN "gfx/icons/plant.2bpp",     INC_FRAME_1
BugIconFrame2:       INCBIN "gfx/icons/bug.2bpp",       INC_FRAME_2
PlantIconFrame2:     INCBIN "gfx/icons/plant.2bpp",     INC_FRAME_2
SnakeIconFrame1:     INCBIN "gfx/icons/snake.2bpp",     INC_FRAME_1
QuadrupedIconFrame1: INCBIN "gfx/icons/quadruped.2bpp", INC_FRAME_1
SnakeIconFrame2:     INCBIN "gfx/icons/snake.2bpp",     INC_FRAME_2
QuadrupedIconFrame2: INCBIN "gfx/icons/quadruped.2bpp", INC_FRAME_2

TradeBubbleIconGFX:  INCBIN "gfx/trade/bubble.2bpp"

PUSHS

SECTION "Party Mon Sprites Routines", ROMX

; load and place the party mon icon according to wMonPartySpriteSpecies
LoadSinglePartyMonSprite:
	; load into the start of VRAM
	call DisableLCD
	ld a, [wMonPartySpriteSpecies]
	ld de, vSprites
	call LoadPartyMonSprite
	call EnableLCD

	; place into the start of OAM
	ld a, [hPartyMonIndex]
	push af
	xor a
	ld [hPartyMonIndex], a
	call PlacePartyMonSprite
	pop af
	ld [hPartyMonIndex], a
	ret

; load the party mon icon for all mon in the party
LoadPartyMonSprites:
	call DisableLCD
	ld de, vSprites
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	push hl
	call LoadPartyMonSprite
	pop hl
	jr .loop
.done
	jp EnableLCD

; copy the 8-tile icon for the mon in register a to de
LoadPartyMonSprite:
	push de

	ld [wPokedexNum], a
	predef IndexToPokedex

	; hMultiplicand = pokedex number - 1
	; xor a
	; ld [hMultiplicand], a
	; ld [hMultiplicand + 1], a
	ld a, [wPokedexNum]
	dec a
	; ld [hMultiplicand + 2], a

	; ; hMultiplier = icon size, in bytes
	; ld a, 8 tiles
	; ld [hMultiplier], a

	; call Multiply

	; ; hl = icon offset
	; ld a, [hProduct + 2]
	; ld h, a
	; ld a, [hProduct + 3]
	; ld l, a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl ; * 8 tiles (1 tile = 16 bytes)

	; if offset < $4000, use first icon bank
	bit 6, h
	set 6, h
	ld a, BANK(PartyMonSprites)
	jr z, .gotBank

	; otherwise, use second icon bank
	inc a

.gotBank
	ld bc, 8 tiles
	pop de
	jp FarCopyData

; copy 1 full entry (16 bytes) from PartyMonOAM into wShadowOAM according to hPartyMonIndex
; and backup wShadowOAM into wMonPartySpritesSavedOAM
PlacePartyMonSprite:
	push hl
	push de
	push bc

	; bc = hPartyMonIndex * 16
	ld a, [hPartyMonIndex]
	add a
	add a
	add a
	add a
	ld c, a
	ld b, 0

	; de = destination address
	ld hl, wShadowOAM
	add hl, bc
	ld d, h
	ld e, l

	; hl = source address
	ld hl, PartyMonOAM
	add hl, bc

	ld bc, 4 * 4
	call CopyData

	; make backup
	ld hl, wShadowOAM
	ld de, wMonPartySpritesSavedOAM
	ld bc, 4 * 4 * PARTY_LENGTH
	call CopyData

	pop bc
	pop de
	pop hl
	ret

PUSHS
SECTION "PC List Icons", ROMX

; Opens the Learnset screen for the status-screen species.
ShowLearnsetFromStatus::
	; the Learnset screen overwrites the menu state of the screen below it, so keep it
	ld hl, wTopMenuItemY
	ld c, wLastMenuItem - wTopMenuItemY + 1
.save
	ld a, [hli]
	push af
	dec c
	jr nz, .save
	ld a, [wMenuCursorLocation]
	push af
	ld a, [wMenuCursorLocation + 1]
	push af
	ld a, [wMenuWatchMovingOutOfBounds]
	push af
	ld a, SFX_PRESS_AB
	call PlaySound
	; The Learnset loader expects the internal species index, not the
	; Pokedex display number; wMonHIndex is the status-screen species.
	ld a, [wMonHIndex]
	ld [wPokedexNum], a
	callfar ShowMonLearnsetMenu
	pop af
	ld [wMenuWatchMovingOutOfBounds], a
	pop af
	ld [wMenuCursorLocation + 1], a
	pop af
	ld [wMenuCursorLocation], a
	ld hl, wLastMenuItem
	ld c, wLastMenuItem - wTopMenuItemY + 1
.restore
	pop af
	ld [hld], a
	dec c
	jr nz, .restore
	ret

; Deposit screen: START shows the status screen of the selected #MON.
PCStartPressed::
	ld a, [wPCDualList]
	and a
	ret z
	ld a, [wCurrentMenuItem]
	ld hl, wListScrollOffset
	add [hl]
	ld c, a
	ld a, [wListCount]
	cp c
	ret c
	ret z ; CANCEL or an empty list
	ld a, c
	ld [wWhichPokemon], a
	ld a, [wListMenuID]
	and a
	ld a, PLAYER_PARTY_DATA
	jr z, .gotLocation
	ld a, BOX_DATA
.gotLocation
	ld [wMonDataLocation], a
	call ClearSprites
	call SaveScreenTilesToBuffer1
	predef StatusScreenOriginal
	call LoadScreenTilesFromBuffer1
	call ReloadTilesetTilePatterns
	call RunDefaultPaletteCommand
	call LoadGBPal
	callfar LoadBillsPCExtraTiles ; the status screen overwrote the Box Info tiles
	ld a, $ff
	ld [wUnusedCreditsByte], a ; the icons were cleared, so reload them
	ret

; Deposit screen: RIGHT moves from the party list to the box list, LEFT moves back.
; Returns carry if the list should be exited to switch lists.
PCSideSwitch::
	ldh a, [hJoyPressed]
	bit B_PAD_START, a
	jr z, .notStart
	call PCStartPressed
	and a
	ret
.notStart
	ld a, [wPCDualList]
	and a
	ret z
	ldh a, [hJoy5]
	bit B_PAD_DOWN, a
	jr nz, PCBottomMenu ; DOWN from the last party #MON
	ld a, [wBagPocketsFlags]
	bit BIT_PREVIOUS_POCKET, a
	ld a, [wListMenuID]
	jr z, .right
	cp PCWITHDRAWLISTMENU
	jr .check
.right
	and a
.check
	jr nz, .stay
	ld a, 2
	ld [wPCDualList], a
	scf
	ret
.stay
	and a
	ret

; Deposit screen: DOWN from the last party #MON moves the cursor to CHANGE BOX / SEE YA.
; UP or B moves back. Returns carry with wPCDualList = 4 (CHANGE BOX) or 5 (SEE YA)
; if one of them was chosen.
PCBottomMenu::
	ld a, [wPCDualList]
	and a
	ret z
	ld a, [wCurrentMenuItem]
	call PlaceUnfilledArrowMenuCursor
	ld hl, wTopMenuItemY
	ld c, wLastMenuItem - wTopMenuItemY + 1
.save
	ld a, [hli]
	push af
	dec c
	jr nz, .save
	ld a, [wMenuCursorLocation]
	push af
	ld a, [wMenuCursorLocation + 1]
	push af
	ld a, [wMenuWatchMovingOutOfBounds]
	push af
	ld hl, wTopMenuItemY
	ld a, 14
	ld [hli], a ; wTopMenuItemY
	ld a, 1
	ld [hli], a ; wTopMenuItemX
	xor a
	ld [hli], a ; wCurrentMenuItem
	inc hl ; wTileBehindCursor
	inc a
	ld [hli], a ; wMaxMenuItem
	ld a, PAD_A | PAD_B | PAD_LEFT | PAD_RIGHT | PAD_UP | PAD_DOWN ; UP/DOWN are watched to update the box label
	ld [hli], a ; wMenuWatchedKeys
	xor a
	ld [hl], a ; wLastMenuItem
	inc a
	ld [wMenuWatchMovingOutOfBounds], a
	call .arrowsOn
.loop
	ld a, [wCurrentMenuItem]
	push af ; item before the keypress
	call HandleMenuInput
	ld b, a
	pop af
	bit B_PAD_UP, b
	jr z, .notUp
	and a
	jr z, .back ; UP from CHANGE BOX
	call .arrowsOn ; moved up to CHANGE BOX
	jr .loop
.notUp
	bit B_PAD_DOWN, b
	jr z, .notDown
	ld d, 0
	call .setArrows ; on SEE YA!
	jr .loop
.notDown
	bit B_PAD_B, b
	jr nz, .back
	bit B_PAD_A, b
	jr nz, .chosen
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .loop ; only CHANGE BOX reacts to LEFT/RIGHT
	callfar QuickChangeBox
	xor a
	ld [wPCOtherScroll], a
	ld [wPCOtherCursor], a
	ldh [hAutoBGTransferEnabled], a
	call PCDrawBothLists
	decoord 13, 13
	callfar DrawCurrentBoxPrompt
	call .arrowsOn ; the prompt was redrawn with the plain label
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	jr .loop
.arrowsOn
	ld d, 1
.setArrows
	callfar SetBoxPromptArrows ; d = arrows on/off
	ret
.chosen
	ld a, [wCurrentMenuItem]
	add 4
	jr .done
.back
	xor a
.done
	push af
	ld d, 0
	call .setArrows ; plain label whenever CHANGE BOX isn't highlighted
	pop af
	ld b, a
	call EraseMenuCursor
	pop af
	ld [wMenuWatchMovingOutOfBounds], a
	pop af
	ld [wMenuCursorLocation + 1], a
	pop af
	ld [wMenuCursorLocation], a
	call EraseMenuCursor ; the list cursor is redrawn by the menu input
	ld hl, wLastMenuItem
	ld c, wLastMenuItem - wTopMenuItemY + 1
.restore
	pop af
	ld [hld], a
	dec c
	jr nz, .restore
	ld a, b
	and a
	ret z
	ld [wPCDualList], a
	scf
	ret

; Draws the party list and the box list together for the deposit screen.
; The list the cursor is in uses wListScrollOffset; the other one uses wPCOtherScroll.
PCDrawBothLists::
	ld a, [wPCDualList]
	and a
	jr nz, .dual
	ld a, [wListMenuID]
	and a
	call z, PCListMonIcons
	jp PrintListMenuEntries
.dual
	ld a, [wListScrollOffset]
	ld b, a
	ld a, [wPCOtherScroll]
	ld e, a
	ld d, b ; assume the party list has the cursor
	ld a, [wPCListSide]
	and a
	jr z, .gotScrolls
	ld d, e
	ld e, b
.gotScrolls
	push de
	ld a, d
	ld [wListScrollOffset], a
	xor a
	call PCSetupListSide
	call PCListMonIcons
	call PrintListMenuEntries ; the party list is drawn first so the box list covers it
	pop de
	push de
	hlcoord 7, 0
	ld b, 11
	ld c, 11
	call TextBoxBorder
	pop de
	push de
	ld a, e
	ld [wListScrollOffset], a
	ld a, 1
	call PCSetupListSide
	call PrintListMenuEntries
	pop de
	ld a, [wPCListSide]
	and a
	ld a, d
	jr z, .restoreScroll
	ld a, e
.restoreScroll
	ld [wListScrollOffset], a
	ld a, [wPCListSide]
	; fall through to restore the list the cursor is in

; a = 0 for the party list, 1 for the box list
PCSetupListSide:
	and a
	ld hl, wPartyCount
	ld b, PCPOKEMONLISTMENU
	jr z, .gotList
	ld hl, wBoxCount
	ld b, PCWITHDRAWLISTMENU
.gotList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	ld a, b
	ld [wListMenuID], a
	ld a, [hl]
	ld [wListCount], a
	ret

; Bill's PC list icons. Called on every redraw of the list, with the LCD on.
; Icons are loaded into vSprites slot = visible row whenever the scroll offset
; changes ([wUnusedCreditsByte] holds the last loaded offset, $ff = none).
PCListMonIcons::
	ld a, [wUnusedCreditsByte]
	ld b, a
	ld a, [wListScrollOffset]
	cp b
	jr z, .placeOAM
	ld [wUnusedCreditsByte], a
	CALL_INDIRECT ClearSpritePaletteMap
	ld hl, wListPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [wListScrollOffset]
	ld e, a
	ld d, 0
	add hl, de
	ld b, 0
.loadLoop
	ld a, [hli]
	cp $ff
	jr z, .placeOAM
	push hl
	push bc
	call .loadIcon
	pop bc
	pop hl
	inc b
	ld a, b
	cp PC_LIST_VISIBLE_ROWS
	jr nz, .loadLoop
.placeOAM
	call ClearSprites
	ld a, [wListCount]
	ld hl, wListScrollOffset
	sub [hl]
	cp PC_LIST_VISIBLE_ROWS
	jr c, .gotCount
	ld a, PC_LIST_VISIBLE_ROWS
.gotCount
	and a
	ret z
	ld c, a
	ld hl, wShadowOAM
	ld d, 16 ; y of the first row's name line
	ld e, 0
.oamLoop
	ld a, d
	ld [hli], a
	ld a, 8 * 1 + 8
	ld [hli], a
	ld a, e
	ld [hli], a
	xor a
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, 8 * 2 + 8
	ld [hli], a
	ld a, e
	inc a
	ld [hli], a
	xor a
	ld [hli], a
	ld a, d
	add 8
	ld [hli], a
	ld a, 8 * 1 + 8
	ld [hli], a
	ld a, e
	add 4
	ld [hli], a
	xor a
	ld [hli], a
	ld a, d
	add 8
	ld [hli], a
	ld a, 8 * 2 + 8
	ld [hli], a
	ld a, e
	add 5
	ld [hli], a
	xor a
	ld [hli], a
	ld a, d
	add 16
	ld d, a
	ld a, e
	add 8
	ld e, a
	dec c
	jr nz, .oamLoop
	ret

; a = species, b = slot
.loadIcon
	push bc
	ld [wPokedexNum], a
	predef IndexToPokedex
	pop bc
	ld a, [wPokedexNum]
	dec a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	bit 6, h
	set 6, h
	ld a, BANK(PartyMonSprites)
	jr z, .gotBank
	inc a
.gotBank
	ld d, h
	ld e, l
	push af
	ld a, b
	srl a
	add HIGH(vSprites)
	ld h, a
	ld a, b
	and 1
	rrca
	ld l, a
	pop af
	ld b, a
	ld c, 8
	jp CopyVideoData

POPS

PartyMonOAM:
	db $10, $10, $00, $00
	db $10, $18, $01, $00
	db $18, $10, $04, $00
	db $18, $18, $05, $00

	db $20, $10, $08, $00
	db $20, $18, $09, $00
	db $28, $10, $0c, $00
	db $28, $18, $0d, $00

	db $30, $10, $10, $00
	db $30, $18, $11, $00
	db $38, $10, $14, $00
	db $38, $18, $15, $00

	db $40, $10, $18, $00
	db $40, $18, $19, $00
	db $48, $10, $1c, $00
	db $48, $18, $1d, $00

	db $50, $10, $20, $00
	db $50, $18, $21, $00
	db $58, $10, $24, $00
	db $58, $18, $25, $00

	db $60, $10, $28, $00
	db $60, $18, $29, $00
	db $68, $10, $2c, $00
	db $68, $18, $2d, $00


SECTION "Party Mon Sprites Gfx 1", ROMX

PartyMonSprites:
INCBIN "gfx/icons/party_mon_sprites.2bpp", $0, $4000


SECTION "Party Mon Sprites Gfx 2", ROMX

INCBIN "gfx/icons/party_mon_sprites.2bpp", $4000

POPS