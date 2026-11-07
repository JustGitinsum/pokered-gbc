DisplayOakLabEmailText:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	CheckEvent EVENT_OAK_ASKED_TO_CHOOSE_MON
	jr z, .display
	ld a, [wStatusFlags4]
	bit BIT_GOT_STARTER, a
	jr nz, .display
	ld a, [wCurMap]
	ld hl, wStarterCheatIntroMap
	cp [hl]
	call z, DisableAutoTextBoxDrawing
.display
	tx_pre_jump OakLabEmailText

OakLabEmailText::
	text_asm
	CheckEvent EVENT_OAK_ASKED_TO_CHOOSE_MON
	jr z, .email
	ld a, [wStatusFlags4]
	bit BIT_GOT_STARTER, a
	jr nz, .email
	farcall OaksLabSecretStarter
	jp TextScriptEnd
.email
	ld hl, .EmailText
	call PrintText
	jp TextScriptEnd

.EmailText:
	text_far _OakLabEmailText
	text_end
