SilphCo1F_Script:
	call EnableAutoTextBoxDrawing
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ret z
	CheckAndSetEvent EVENT_SILPH_CO_RECEPTIONIST_AT_DESK
	ret nz
	ld a, HS_SILPH_CO_1F_RECEPTIONIST
	ld [wMissableObjectIndex], a
	predef_jump ShowObject
	

SilphCo1F_TextPointers:
	def_text_pointers
	dw_const SilphCo1FLinkReceptionistText, TEXT_SILPHCO1F_LINK_RECEPTIONIST

SilphCo1FLinkReceptionistText:
	text_asm
	CheckEvent EVENT_BEAT_SABRINA
	jr nz, .SecretSilphShop
	ld hl, PreRocketText
	call PrintText
	jp TextScriptEnd

.SecretSilphShop
	call SaffronMasterBallShop
	jp TextScriptEnd

PreRocketText:
	text_far _SilphCo1FLinkReceptionistText
	text_end

SaffronMasterBallShop:
	; marcelnote - recreating item list manually because I do not know
;              how to integrate script_mart in text_asm
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld hl, wItemList
	ld a, 2 ; 1st entry = total number of items in the list
	ld [hli], a
	ld a, POKE_DOLL
	ld [hli], a
	ld a, MASTER_BALL
	ld [hli], a
	ld a, -1 ; ends the list
	ld [hl], a
   	ld hl, PokemartGreetingText
   	call PrintText
   	ld a, PRICEDITEMLISTMENU
   	ld [wListMenuID], a
   	callfar DisplayPokemartDialogue_
   	ret


	