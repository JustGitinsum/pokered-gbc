; Hooks for drawing exp bars in status_screen.asm

StatusScreenHook:
	; b = SET_PAL_STATUS_SCREEN
	call RunPaletteCommand
IF GEN_2_GRAPHICS
	decoord 18, 5
	ld a, [wBattleMonLevel]
	push af
	ld a, [wLoadedMonLevel]
	ld [wBattleMonLevel], a
	farcall PrintEXPBar
	pop af
	ld [wBattleMonLevel], a
ENDC
	ret

StatusScreen2Hook:
	farcall InitStatusScreenPPPalettes
IF GEN_2_GRAPHICS
	ldh a, [rWBK]
	ld d, a
	ld a, 2
	ldh [rWBK], a
	; The stack is banked too; save and restore in the same WRAM bank.
	push de
	ld hl, W2_TilesetPaletteMap + 8 * SCREEN_WIDTH
	ld bc, 10 * SCREEN_WIDTH
	ld a, 1
	call FillMemory
	ld a, 3
	ld [W2_StaticPaletteMapChanged], a
	pop af
	ldh [rWBK], a
ENDC
	hlcoord 19, 1
	lb bc, 6, 10
	jp DrawLineBox ; Draws the experience panel
