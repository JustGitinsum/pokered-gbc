DEF STATUS_ICON_TILE EQU $50

IF GEN_2_GRAPHICS
DEF ENEMY_STATUS_ICON EQU SCREEN_WIDTH + 4
ELSE
DEF ENEMY_STATUS_ICON EQU SCREEN_WIDTH + 2
ENDC
DEF PLAYER_STATUS_ICON EQU 8 * SCREEN_WIDTH + 12
DEF PARTY_STATUS_ICON  EQU 17
DEF STATS_STATUS_ICON  EQU 2 * SCREEN_WIDTH + 12

; Battle HUD palette slots; the base value restores the HUD palette when the icon is cleared.
DEF ENEMY_STATUS_ICON_PALS  EQU 6 << 8 | 3
DEF PLAYER_STATUS_ICON_PALS EQU 7 << 8 | 2
DEF STATS_STATUS_ICON_PAL   EQU 7

; Called after picture palettes are loaded, before the status palette replaces it.
CaptureBattlePicturePalette:
	ldh a, [rWBK]
	ld b, a
	ld a, 2
	ldh [rWBK], a
	xor a
	ld [W2_BattlePictureSplitActive], a
	push bc
	ld hl, W2_TilesetPaletteMap + 12
	ld b, 7
.scanRow
	ld c, 7
.scanTile
	ld a, [hli]
	and 7
	cp 6
	jr z, .capture
	dec c
	jr nz, .scanTile
	ld de, SCREEN_WIDTH - 7
	add hl, de
	dec b
	jr nz, .scanRow
	pop bc
	jr .done
.capture
	ld hl, W2_BgPaletteData + 6 * 8
	ld de, W2_BattlePicturePalette
	ld bc, 8
	call CopyData
	; Front-picture IDs are column-major, seven tiles per column.
	ld hl, W2_TilesetPaletteMap + 12
	ld de, W2_BattlePictureTileAttrs
	ld b, 7
.column
	push hl
	ld c, 7
.row
	ld a, [hl]
	ld [de], a
	inc de
	push de
	ld de, SCREEN_WIDTH
	add hl, de
	pop de
	dec c
	jr nz, .row
	pop hl
	inc hl
	dec b
	jr nz, .column
	pop bc
	ld a, 1
	ld [W2_BattlePictureSplitActive], a
.done
	ld a, b
	ldh [rWBK], a
	ret

; Palette commands relinquish both raster regions with one WRAM-bank switch.
ClearBattlePaletteSplits:
	ldh a, [rWBK]
	ld b, a
	ld a, 2
	ldh [rWBK], a
	xor a
	ld [W2_BattlePictureSplitActive], a
	jp ClearBattlePaletteSplit.clear

; DE = front-picture load destination. Replacement state follows graphics,
; not HAS_SUBSTITUTE_UP, since animations temporarily reveal the original mon.
MarkBattlePictureOriginal::
	ld a, d
	cp HIGH(vFrontPic)
	ret nz
	ld a, e
	cp LOW(vFrontPic)
	ret nz
	ld c, 0
	jr SetBattlePictureReplacement

MarkBattlePictureReplaced:
	ldh a, [hWhoseTurn]
	and a
	ret z
	ld c, 1
SetBattlePictureReplacement:
	ldh a, [rWBK]
	ld b, a
	ld a, 2
	ldh [rWBK], a
	ld a, c
	ld [W2_BattlePictureReplaced], a
	ld a, b
	ldh [rWBK], a
	ret

; Slot 5's category/ball hint is absent during upward slides. Its saved palette
; can use the item-preview save area: no item menu runs inside this effect.
BeginBattlePictureSlideUp:
	ldh a, [hWhoseTurn]
	and a
	ret z
	ldh a, [rWBK]
	ld b, a
	ld a, 2
	ldh [rWBK], a
	push bc
	ld a, [W2_BattlePictureSplitActive]
	and a
	jr z, .done
	ld a, [W2_BattlePictureReplaced]
	and a
	jr nz, .done
	ld hl, W2_BgPaletteData + 5 * 8
	ld de, W2_ItemMenuSavedTMPalettes + 8
	ld bc, 8
	call CopyData
	ld hl, W2_BattlePicturePalette
	ld de, W2_BgPaletteData + 5 * 8
	ld bc, 8
	call CopyData
	ld a, 1
	ld [W2_BattlePictureSlot5Active], a
	ld [W2_ForceBGPUpdate], a
	pop bc
	ld a, b
	ldh [rWBK], a
	; Let all attribute-map thirds catch up before moving into the status rows.
	jp Delay3
.done
	pop bc
	ld a, b
	ldh [rWBK], a
	ret

EndBattlePictureSlideUp:
	ldh a, [hWhoseTurn]
	and a
	ret z
	ldh a, [rWBK]
	ld b, a
	ld a, 2
	ldh [rWBK], a
	push bc
	ld a, [W2_BattlePictureSlot5Active]
	and a
	jr z, .done
	xor a
	ld [W2_BattlePictureSlot5Active], a
	; Restore slot-6 attributes before returning slot 5 to its UI owner.
	call Delay3
	ld hl, W2_ItemMenuSavedTMPalettes + 8
	ld de, W2_BgPaletteData + 5 * 8
	ld bc, 8
	call CopyData
	ld a, 1
	ld [W2_ForceBGPUpdate], a
.done
	pop bc
	ld a, b
	ldh [rWBK], a
	ret

; d = PP palette ID. Keep slot 6 intact for the opponent's HUD and picture.
SetBattleLowPPPalette:
	ld l, d
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, SuperPalettes
	add hl, de
	ldh a, [rWBK]
	ld b, a
	ld a, 2
	ldh [rWBK], a
	push bc
	xor a
	ld [W2_BattlePaletteSplitActive], a
	ld de, W2_BattleLowerPalette
	ld bc, 8
	ld a, BANK(SuperPalettes)
	call FarCopyData2
	ld a, 1
	ld [W2_BattlePaletteSplitActive], a
	pop bc
	ld a, b
	ldh [rWBK], a
	ret

ClearBattlePaletteSplit::
	ldh a, [rWBK]
	ld b, a
	ld a, 2
	ldh [rWBK], a
.clear
	ld a, [W2_BattlePaletteSplitActive]
	and a
	jr z, .done
	xor a
	ld [W2_BattlePaletteSplitActive], a
	inc a
	ld [W2_ForceBGPUpdate], a
.done
	ld a, b
	ldh [rWBK], a
	ret

LoadStatusIconTiles:
	ld a, 1
	ldh [rVBK], a
	ld hl, BattleStatusIconGraphics
	ld de, vChars2 tile STATUS_ICON_TILE
	ld bc, BattleStatusIconGraphicsEnd - BattleStatusIconGraphics
	ld a, BANK(BattleStatusIconGraphics)
	call FarCopyData2
	xor a
	ldh [rVBK], a
	ret

LoadPartyStatusIconTiles:
	call DisableLCD
	call LoadStatusIconTiles
	jp EnableLCD

; hl = status byte; returns a = icon index, or carry if there is no status.
GetStatusIconIndex:
	ld b, [hl]
	dec hl
	dec hl
	ld a, [hld]
	or [hl]
	ld a, 5 ; fainted
	ret z
	xor a ; poison
	bit PSN, b
	ret nz
	inc a ; paralysis
	bit PAR, b
	ret nz
	inc a ; sleep
	ld c, a
	ld a, b
	and SLP_MASK
	ld a, c
	ret nz
	inc a ; burn
	bit BRN, b
	ret nz
	inc a ; freeze
	bit FRZ, b
	ret nz
	scf
	ret

; hl = status byte, de = destination; returns GetStatusIconIndex's result.
DrawStatusIcon:
	call GetStatusIconIndex
	push af
	ld b, " "
	ld c, b
	jr c, .write
	add a
	add STATUS_ICON_TILE
	ld b, a
	inc a
	ld c, a
.write
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	dec de
	pop af
	ret

; de = icon tile; b = palette slot, c = base attribute when carry is set.
; a = icon index when carry is clear.
ColorStatusIcon:
	jr c, SetStatusIconAttribute
	push de
	push bc
	ld c, a
	ld b, 0
	ld hl, StatusIconPalettes
	add hl, bc
	pop bc
	push bc
	ld d, [hl]
	ld e, b
	farcall LoadSGBPalette
	pop bc
	pop de
	ld a, b
	or 1 << B_BG_BANK1
	ld c, a
; de = icon tile, c = attribute. The stack is not used while WRAM bank 2 is selected.
SetStatusIconAttribute:
	ld hl, W2_TilesetPaletteMap - wTileMap
	add hl, de
	ldh a, [rWBK]
	ld b, a
	ld a, 2
	ldh [rWBK], a
	ld a, c
	ld [hli], a
	ld [hl], a
	ld a, 3
	ld [W2_StaticPaletteMapChanged], a
	ld a, 1
	ld [W2_ForceBGPUpdate], a
	ld a, b
	ldh [rWBK], a
	ret

; de = wLoadedMonStatus or wEnemyMonStatus
PrintBattleStatusCondition:
	ld h, d
	ld l, e
	ld a, e
	cp LOW(wEnemyMonStatus)
	jr nz, .player
	ld a, d
	cp HIGH(wEnemyMonStatus)
	jr nz, .player
	ld de, wTileMap + ENEMY_STATUS_ICON
	ld bc, ENEMY_STATUS_ICON_PALS
	jr .draw
.player
	ld de, wTileMap + PLAYER_STATUS_ICON
	ld bc, PLAYER_STATUS_ICON_PALS
.draw
	push bc
	call DrawStatusIcon
	pop bc
	jr ColorStatusIcon

; Reapplies battle icon colors after the battle palette map is rebuilt.
RefreshBattleStatusIconColors:
	ld de, wTileMap + ENEMY_STATUS_ICON
	ld b, HIGH(ENEMY_STATUS_ICON_PALS)
	call .refresh
	ld de, wTileMap + PLAYER_STATUS_ICON
	ld b, HIGH(PLAYER_STATUS_ICON_PALS)
.refresh
	ld a, [de]
	sub STATUS_ICON_TILE
	cp 12
	ret nc
	srl a ; icon tiles start on even IDs, so this clears carry
	jr ColorStatusIcon

PrintPartyMenuStatusIcon:
	ld hl, wTileMap + PARTY_STATUS_ICON
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wLoadedMonStatus
	jp DrawStatusIcon

PrintStatusScreenConditionIcon::
	call LoadPartyStatusIconTiles
	ld hl, wLoadedMonStatus
	ld de, wTileMap + STATS_STATUS_ICON
	call DrawStatusIcon
	ret c
	ld b, STATS_STATUS_ICON_PAL
	jp ColorStatusIcon

ApplyPartyMenuStatusIconPalettes:
	ld c, 0
.loadPalette
	push bc
	ld b, 0
	ld hl, StatusIconPalettes
	add hl, bc
	ld d, [hl]
	ld hl, PartyStatusIconSlots
	add hl, bc
	ld e, [hl]
	farcall LoadSGBPalette
	pop bc
	inc c
	ld a, c
	cp PartyStatusIconSlots.End - PartyStatusIconSlots
	jr nz, .loadPalette

; Refresh after a submenu covers icons or the saved party tilemap is restored.
ApplyPartyMenuStatusIconAttributes:
	ld de, wTileMap + PARTY_STATUS_ICON
	ld a, PARTY_LENGTH
.row
	push af
	ld a, [de]
	sub STATUS_ICON_TILE
	cp 12
	ld c, 1 ; normal bank-0 text, using the green HP-bar palette
	jr nc, .setAttribute
	srl a
	ld c, a
	ld b, 0
	ld hl, PartyStatusIconSlots
	add hl, bc
	ld a, [hl]
	or 1 << B_BG_BANK1
	ld c, a
.setAttribute
	call SetStatusIconAttribute
	ld hl, 2 * SCREEN_WIDTH
	add hl, de
	ld d, h
	ld e, l
	pop af
	dec a
	jr nz, .row
	ret

StatusIconPalettes:
IF GEN_2_GRAPHICS
	db PAL_PURPLEMON, PAL_YELLOWBAR, PAL_GRAYMON, PAL_REDBAR, PAL_EXP, PAL_BLACK
ELSE
	db PAL_PURPLEMON, PAL_YELLOWBAR, PAL_GRAYMON, PAL_REDMON, PAL_BLUEMON, PAL_BLACK
ENDC

; Party-menu palette slots; paralysis shares the yellow HP-bar slot.
PartyStatusIconSlots:
	db 4, 2, 6, 7, 5, 0
.End
