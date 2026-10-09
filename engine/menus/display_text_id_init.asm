; function that performs initialization for DisplayTextID
DisplayTextIDInit::
	xor a
	ld [wListMenuID], a
	call IsFastPokemonCenterNurse
	push af
	jr c, .skipDrawingTextBoxBorder
	ld a, [wAutoTextBoxDrawingControl]
	bit BIT_NO_AUTO_TEXT_BOX, a
	jr nz, .skipDrawingTextBoxBorder
	ldh a, [hTextID]
	and a
	jr nz, .notStartMenu
; if text ID is 0 (i.e. the start menu)
; Note that the start menu text border is also drawn in the function directly
; below this, so this seems unnecessary.
	CheckEvent EVENT_GOT_POKEDEX
; start menu with pokedex
	hlcoord 10, 0
	ld b, $0e
	ld c, $08
	jr nz, .drawTextBoxBorder
; start menu without pokedex
	hlcoord 10, 0
	ld b, $0c
	ld c, $08
	jr .drawTextBoxBorder
; if text ID is not 0 (i.e. not the start menu) then do a standard dialogue text box
.notStartMenu
	hlcoord 0, 12
	ld b, $04
	ld c, $12
.drawTextBoxBorder
	call TextBoxBorder
.skipDrawingTextBoxBorder
	ld hl, wFontLoaded
	set BIT_FONT_LOADED, [hl]
	ld hl, wMiscFlags
	bit BIT_NO_SPRITE_UPDATES, [hl]
	res BIT_NO_SPRITE_UPDATES, [hl]
	jr nz, .skipMovingSprites
	call UpdateSprites
.skipMovingSprites
; loop to copy [x#SPRITESTATEDATA1_FACINGDIRECTION] to
; [x#SPRITESTATEDATA2_ORIGFACINGDIRECTION] for each non-player sprite
; this is done because when you talk to an NPC, they turn to look your way
; the original direction they were facing must be restored after the dialogue is over
	ld hl, wSprite01StateData1FacingDirection
	ld c, $0f
	ld de, $10
.spriteFacingDirectionCopyLoop
	ld a, [hl] ; x#SPRITESTATEDATA1_FACINGDIRECTION
	inc h
	ld [hl], a ; [x#SPRITESTATEDATA2_ORIGFACINGDIRECTION]
	dec h
	add hl, de
	dec c
	jr nz, .spriteFacingDirectionCopyLoop
; loop to force all the sprites in the middle of animation to stand still
; (so that they don't like they're frozen mid-step during the dialogue)
	ld hl, wSpritePlayerStateData1ImageIndex
	ld de, $10
	ld c, e
.spriteStandStillLoop
	ld a, [hl]
	cp $ff ; is the sprite visible?
	jr z, .nextSprite
; if it is visible
	and $fc
	ld [hl], a
.nextSprite
	add hl, de
	dec c
	jr nz, .spriteStandStillLoop
	pop af
	ret c
	ld b, $9c ; window background address
	call CopyScreenTileBufferToVRAM ; transfer background in WRAM to VRAM
	xor a
	ldh [hWY], a ; put the window on the screen
	call LoadFontTilePatterns
	ld a, $01
	ldh [hAutoBGTransferEnabled], a ; enable continuous WRAM to VRAM transfer each V-blank
	ret

IsFastPokemonCenterNurse:
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	jr nz, .no
	ldh a, [hSpriteIndex]
	cp 1
	jr nz, .no
	ld a, [wCurMap]
	cp VIRIDIAN_POKECENTER
	jr z, .yes
	cp PEWTER_POKECENTER
	jr z, .yes
	cp CERULEAN_POKECENTER
	jr z, .yes
	cp MT_MOON_POKECENTER
	jr z, .yes
	cp ROCK_TUNNEL_POKECENTER
	jr z, .yes
	cp VERMILION_POKECENTER
	jr z, .yes
	cp CELADON_POKECENTER
	jr z, .yes
	cp LAVENDER_POKECENTER
	jr z, .yes
	cp FUCHSIA_POKECENTER
	jr z, .yes
	cp CINNABAR_POKECENTER
	jr z, .yes
	cp SAFFRON_POKECENTER
	jr nz, .no
.yes
	scf
	ret
.no
	and a
	ret
