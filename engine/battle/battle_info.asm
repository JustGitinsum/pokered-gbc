MACRO battle_info_copy
	ld hl, \1
	ld de, \2
	ld bc, \3
	call BattleInfoCopyResources
ENDM

HandleBattleMenuInput:
	; Observe vertical cursor changes without treating them as menu selections.
	ld a, [wMenuWatchedKeys]
	push af
	or PAD_UP | PAD_DOWN | PAD_START
	ld [wMenuWatchedKeys], a
.loop
	farcall UpdateBattleMenuBallHint
	call HandleMenuInput
	ldh a, [hJoy5]
	bit B_PAD_START, a
	jr z, .checkSelection
	ld a, [wBattleType]
	and a
	jr nz, .loop
	call ShowBattleInfoScreen
	jr .loop
.checkSelection
	pop bc
	push bc
	ldh a, [hJoy5]
	and b
	jr z, .loop
	pop af
	ld [wMenuWatchedKeys], a
	ret

ShowBattleInfoScreen::
	ld a, [wPokedexNum]
	push af
	ld a, [wAnimCounter]
	push af
	ldh a, [hTileAnimations]
	push af
	ldh a, [hAutoBGTransferEnabled]
	push af
	call GBPalWhiteOutWithDelay3
	call DisableLCD
	call SaveBattleInfoResources
	xor a
	ldh [hTileAnimations], a
	ldh [hAutoBGTransferEnabled], a
	ld [wAnimCounter], a
	ld [wBattleInfoSide], a
	ld hl, wTileMap
	ld bc, SCREEN_AREA
	ld a, " "
	call FillMemory
	call ClearSprites
	call InitBattleInfoPalettes
	ld hl, BattleStatusIconGraphics
	ld de, vSprites tile $20
	ld bc, BattleStatusIconGraphicsEnd - BattleStatusIconGraphics
	ld a, BANK(BattleStatusIconGraphics)
	call FarCopyData2
	ld hl, PokeballTileGraphics
	ld de, vChars2 tile $60
	ld bc, PokeballTileGraphicsEnd - PokeballTileGraphics
	ld a, BANK(PokeballTileGraphics)
	call FarCopyData2
	ld hl, BattleInfoPlus
	ld de, vChars2 tile $64
	ld bc, 8
	ld a, BANK(BattleInfoPlus)
	call FarCopyDataDouble
	hlcoord 0, 0
	lb bc, 7, 18
	call TextBoxBorder
	hlcoord 0, 9
	lb bc, 7, 18
	call TextBoxBorder
	call EnableLCD
	call DrawBattleInfoSide
	ld a, 1
	ld [wBattleInfoSide], a
	call DrawBattleInfoSide
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	call GBPalNormal
.input
	call DelayFrame
	call AnimateBattleInfoIcons
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	bit B_PAD_B, a
	jr z, .input
	ld a, SFX_PRESS_AB
	call PlaySound
	call GBPalWhiteOutWithDelay3
	call DisableLCD
	call RestoreBattleInfoResources
	call EnableLCD
	call Delay3
	call GBPalNormal
	pop af
	ldh [hAutoBGTransferEnabled], a
	pop af
	ldh [hTileAnimations], a
	pop af
	ld [wAnimCounter], a
	pop af
	ld [wPokedexNum], a
	ret

; Called with bank 1 selected and the LCD off. Do not touch the banked stack
; until bank 1 is restored; CopyData cannot safely be called from this loop.
BattleInfoCopyResources:
	ld a, 3
	ldh [rWBK], a
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy
	xor a
	ldh [rWBK], a
	ret

SaveBattleInfoResources:
	ld hl, W3_BattleInfoSavedColorState
.color
	ld a, 2
	ldh [rWBK], a
	ld b, [hl]
	ld a, 3
	ldh [rWBK], a
	ld [hl], b
	inc hl
	ld a, h
	cp HIGH(W3_BattleInfoSavedSprites)
	jr nz, .color
	xor a
	ldh [rWBK], a
	battle_info_copy vSprites, W3_BattleInfoSavedSprites, $2c tiles
	battle_info_copy vChars2 tile $40, W3_BattleInfoSavedTypes, $10 tiles
	battle_info_copy vChars2 tile $60, W3_BattleInfoSavedBalls, 5 tiles
	battle_info_copy wTileMap, W3_BattleInfoSavedTileMap, SCREEN_AREA
	battle_info_copy wShadowOAM, W3_BattleInfoSavedOAM, 40 * 4
	ret

RestoreBattleInfoResources:
	battle_info_copy W3_BattleInfoSavedSprites, vSprites, $2c tiles
	battle_info_copy W3_BattleInfoSavedTypes, vChars2 tile $40, $10 tiles
	battle_info_copy W3_BattleInfoSavedBalls, vChars2 tile $60, 5 tiles
	battle_info_copy W3_BattleInfoSavedTileMap, wTileMap, SCREEN_AREA
	battle_info_copy W3_BattleInfoSavedOAM, wShadowOAM, 40 * 4
	ld hl, W3_BattleInfoSavedColorState
.color
	ld a, 3
	ldh [rWBK], a
	ld b, [hl]
	ld a, 2
	ldh [rWBK], a
	ld [hl], b
	inc hl
	ld a, h
	cp HIGH(W3_BattleInfoSavedSprites)
	jr nz, .color
	ld a, 3
	ld [W2_StaticPaletteMapChanged], a
	ld a, 1
	ld [W2_ForceBGPUpdate], a
	ld [W2_ForceOBPUpdate], a
	xor a
	ldh [rWBK], a
	ret

InitBattleInfoPalettes:
	farcall ClearBattlePaletteSplits
	ld a, 2
	ldh [rWBK], a
	xor a
	ld [W2_TileBasedPalettes], a
	ld [W2_UseOBP1], a
	ld hl, W2_TilesetPaletteMap
	ld bc, $180
	call FillMemory
	ld a, 3
	ld [W2_StaticPaletteMapChanged], a
	xor a
	ldh [rWBK], a
	lb de, PAL_BLACK, 0
	farcall LoadSGBPalette
	lb de, PAL_REDTEXT, 1
	farcall LoadSGBPalette
	lb de, PAL_LOGO2, 2
	farcall LoadSGBPalette
	lb de, PAL_REDMON, 7
	farcall LoadSGBPalette
	ld a, 2
	ldh [rWBK], a
	ld a, 1
	ld [W2_ForceBGPUpdate], a
	ld [W2_ForceOBPUpdate], a
	xor a
	ldh [rWBK], a
	ret

DrawBattleInfoSide:
	call DisableLCD
	ld a, [wBattleInfoSide]
	and a
	ld a, [wEnemyMonSpecies]
	ld de, vSprites
	jr z, .icon
	ld a, [wBattleMonSpecies]
	ld de, vSprites tile 8
.icon
	ld [wPokedexNum], a
	farcall LoadBattleInfoMonIcon
	call EnableLCD
	ld a, [wBattleInfoSide]
	ld hl, BattleInfoMonOAM
	and a
	jr z, .oam
	ld hl, BattleInfoMonOAM + 4 * 4
.oam
	push hl
	ld hl, wShadowOAM
	ld bc, 4 * 4
	call BattleInfoSpriteOffset
	ld d, h
	ld e, l
	pop hl
	ld bc, 4 * 4
	call CopyData
	hlcoord 3, 1
	call BattleInfoCoord
	ld [hl], "<LV>"
	inc hl
	ld de, wEnemyMonLevel
	ld a, [wBattleInfoSide]
	and a
	jr z, .level
	ld de, wBattleMonLevel
.level
	lb bc, LEFT_ALIGN | 1, 3
	call PrintNumber
	call DrawBattleInfoTypes
	call DrawBattleInfoStatus
	call DrawBattleInfoParty
	jp DrawBattleInfoStats

; Add the bottom panel's row offset to a top-panel tile-map coordinate.
BattleInfoCoord:
	ld bc, 9 * SCREEN_WIDTH
BattleInfoSpriteOffset:
	ld a, [wBattleInfoSide]
	and a
	ret z
	add hl, bc
	ret

DrawBattleInfoTypes:
	ld hl, wEnemyMonType1
	ld a, [wBattleInfoSide]
	and a
	jr z, .types
	ld hl, wBattleMonType1
.types
	ld a, [hli]
	ld b, [hl]
	push bc
	push af
	ld d, a
	ld e, $40
	ld a, [wBattleInfoSide]
	and a
	jr z, .firstTile
	ld e, $48
.firstTile
	push de
	farcall LoadTypeIcon4TileAt
	pop de
	hlcoord 3, 2
	call BattleInfoCoord
	ld c, e
	call PlaceBattleInfoType
	pop af
	pop bc
	cp b
	ret z
	ld d, b
	ld e, $44
	ld a, [wBattleInfoSide]
	and a
	jr z, .secondTile
	ld e, $4c
.secondTile
	push de
	farcall LoadTypeIcon4TileAt
	pop de
	hlcoord 7, 2
	call BattleInfoCoord
	ld c, e
PlaceBattleInfoType:
	push hl
	push de
	ld b, 4
.tiles
	ld a, c
	ld [hli], a
	inc c
	dec b
	jr nz, .tiles
	; Use the same type colors as the battle move preview.
	farcall GetBattleInfoTypePalette
	pop bc
	ld a, c
	sub $40
	srl a
	srl a
	add 3
	ld e, a
	push de
	farcall LoadSGBPalette
	pop bc
	pop hl
	ld b, 4
	jp SetBattleInfoAttributes

DrawBattleInfoStatus:
	ld de, wEnemyMonStatus
	ld a, [wBattleInfoSide]
	and a
	jr z, .status
	ld de, wBattleMonStatus
.status
	farcall GetBattleInfoStatus
	ret c
	push de
	ld a, [wBattleInfoSide]
	add 3
	ld e, a
	farcall LoadSGBPalette_Sprite
	pop de
	ld a, e
	add a
	add $20
	push af
	ld hl, wShadowOAMSprite08
	ld bc, 2 * 4
	call BattleInfoSpriteOffset
	pop af
	ld c, a
	ld a, [wBattleInfoSide]
	and a
	ld b, 24
	jr z, .y
	ld b, 96
.y
	ld a, [wBattleInfoSide]
	add 3
	ld d, a
	ld e, 64
.sprite
	ld [hl], b
	inc hl
	ld [hl], e
	inc hl
	ld [hl], c
	inc hl
	ld [hl], d
	inc hl
	inc c
	ld a, e
	add 8
	ld e, a
	cp 80
	jr nz, .sprite
	; Sprite colors are assigned by tile ID, not the OAM palette bits.
	ld a, c
	sub 2
	ld l, a
	ld h, 0
	ld c, d
	ld de, W2_SpritePaletteMap
	add hl, de
	ld a, 2
	ldh [rWBK], a
	ld [hl], c
	inc hl
	ld [hl], c
	xor a
	ldh [rWBK], a
	ret

DrawBattleInfoParty:
	ld a, [wIsInBattle]
	cp 2
	ret nz
	farcall SetupBattleInfoPokeballs
	; Party records can lag behind the active mon's current HP/status.
	ld de, wEnemyMonStatus
	ld a, [wBattleInfoSide]
	and a
	jr z, .active
	ld de, wBattleMonStatus
.active
	farcall GetBattleInfoStatus
	ld b, $31
	jr c, .ball
	inc b
	ld a, e
	cp 5
	jr nz, .ball
	inc b
.ball
	ld a, [wEnemyMonPartyPos]
	ld c, a
	ld a, [wBattleInfoSide]
	and a
	jr z, .slot
	ld a, [wPlayerMonNumber]
	ld c, a
.slot
	ld hl, wBuffer
	ld a, b
	ld b, 0
	add hl, bc
	ld [hl], a
	hlcoord 13, 1
	call BattleInfoCoord
	ld de, wBuffer
	ld b, PARTY_LENGTH
.balls
	ld a, [de]
	sub $31
	add $60
	ld [hli], a
	inc de
	dec b
	jr nz, .balls
	hlcoord 13, 1
	call BattleInfoCoord
	lb bc, PARTY_LENGTH, 7
	jp SetBattleInfoAttributes

DrawBattleInfoStats:
	ld de, BattleInfoStatRows
	ld a, 8
.row
	push af
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	inc de
	call BattleInfoCoord
	push hl
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	inc de
	push de
	push af
	ld d, b
	ld e, c
	call PlaceString
	pop af
	push bc ; end of the stat label = sign position
	cp $ff
	jr z, .crit
	ld hl, wEnemyMonStatMods
	ld c, a
	ld b, 0
	ld a, [wBattleInfoSide]
	and a
	jr z, .mods
	ld hl, wPlayerMonStatMods
.mods
	add hl, bc
	ld a, [hl]
	jr .stage
.crit
	ld hl, wEnemyBattleStatus2
	ld a, [wBattleInfoSide]
	and a
	jr z, .focus
	ld hl, wPlayerBattleStatus2
.focus
	ld a, 7
	bit GETTING_PUMPED, [hl]
	jr z, .stage
	inc a
	inc a ; Focus Energy is +2 crit stages
.stage
	pop hl
	ld c, 0
	ld [hl], $64
	sub 7
	jr z, .number
	ld c, 2
	jr nc, .number
	ld c, 1
	ld [hl], "-"
	cpl
	inc a
.number
	inc hl
	add "0"
	ld [hli], a
	ld a, c
	pop de ; next table entry
	pop bc ; start of the label
	push de
	ld e, a
	ld a, l
	sub c
	ld h, b
	ld l, c
	ld b, a
	ld c, e
	call SetBattleInfoAttributes
	pop de
	pop af
	dec a
	jp nz, .row
	ret

; hl = tile-map destination, b = width, c = palette/bank attribute
SetBattleInfoAttributes:
	ld de, W2_TilesetPaletteMap - wTileMap
	add hl, de
	ld a, 2
	ldh [rWBK], a
.attributes
	ld [hl], c
	inc hl
	dec b
	jr nz, .attributes
	ld a, 3
	ld [W2_StaticPaletteMapChanged], a
	xor a
	ldh [rWBK], a
	ret

AnimateBattleInfoIcons:
	ld hl, wAnimCounter
	inc [hl]
	ld a, [hl]
	cp 10
	ret c
	xor a
	ld [hl], a
	ld hl, wShadowOAMSprite00TileID
	ld de, 4
	ld b, 8
.tile
	ld a, [hl]
	xor 2
	ld [hl], a
	add hl, de
	dec b
	jr nz, .tile
	ret

BattleInfoMonOAM:
	db 24, 16, 0, 1
	db 24, 24, 1, 1
	db 32, 16, 4, 1
	db 32, 24, 5, 1
	db 96, 16, 8, 2
	db 96, 24, 9, 2
	db 104, 16, 12, 2
	db 104, 24, 13, 2

BattleInfoPlus:
	db $00, $18, $18, $7e, $18, $18, $00, $00

BattleInfoStatRows:
	dw wTileMap + 4 * SCREEN_WIDTH + 3, .Attack
	db 0
	dw wTileMap + 5 * SCREEN_WIDTH + 3, .Defense
	db 1
	dw wTileMap + 6 * SCREEN_WIDTH + 3, .Speed
	db 2
	dw wTileMap + 7 * SCREEN_WIDTH + 3, .Accuracy
	db 5
	dw wTileMap + 4 * SCREEN_WIDTH + 11, .SpecialAttack
	db 3
	dw wTileMap + 5 * SCREEN_WIDTH + 11, .SpecialDefense
	db 4
	dw wTileMap + 6 * SCREEN_WIDTH + 11, .Critical
	db $ff
	dw wTileMap + 7 * SCREEN_WIDTH + 11, .Evasion
	db 6
.Attack
	db "Atk @"
.Defense
	db "Def @"
.Speed
	db "Spd @"
.Accuracy
	db "Acc @"
.SpecialAttack
	db "SAtk @"
.SpecialDefense
	db "SDef @"
.Critical
	db "Crit @"
.Evasion
	db "Eva  @"
