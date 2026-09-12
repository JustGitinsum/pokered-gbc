; This file only included if GEN_2_GRAPHICS is set

LoadHPBarAndEXPBar::
	ld de, HpBarAndStatusGraphics
	ld hl, vChars2 tile $62
	lb bc, BANK(HpBarAndStatusGraphics), (HpBarAndStatusGraphicsEnd - HpBarAndStatusGraphics) / $10
	call GoodCopyVideoData
	ld de, EXPBarGraphics
	ld hl, vChars1 tile $40
	lb bc, BANK(EXPBarGraphics), (EXPBarGraphicsEnd - EXPBarGraphics) / $10
GoodCopyVideoData:
	ldh a, [rLCDC]
	bit 7, a ; is the LCD enabled?
	jp nz, CopyVideoData ; if LCD is on, transfer during V-blank
	ld a, b
	push hl
	push de
	ld h, 0
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	pop hl
	pop de
	jp FarCopyData2 ; if LCD is off, transfer all at once

LoadPhysicalMoveIcon::
	ld de, MovePhysicalGraphics
	; ld bc, 2 tiles
	ld hl, vChars1 tile $5A
	lb bc, BANK(MovePhysicalGraphics), 2
	call CopyVideoData
	ret
LoadSpecialMoveIcon::
	ld de, MoveSpecialGraphics
	; ld bc, 2 tiles
	ld hl, vChars1 tile $5C
	lb bc, BANK(MoveSpecialGraphics), 2
	call CopyVideoData
	ret
LoadStatusMoveIcon::
	ld de, MoveStatusGraphics
	; ld bc, 2 tiles
	ld hl, vChars1 tile $5E
	lb bc, BANK(MoveStatusGraphics), 2
	call CopyVideoData
	ret
