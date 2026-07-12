CeruleanBadgeHouse_Script:
	ld a, 1 << BIT_NO_AUTO_TEXT_BOX
	ld [wAutoTextBoxDrawingControl], a
	dec a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call EnableAutoTextBoxDrawing
	ret

CeruleanBadgeHouse_TextPointers:
	def_text_pointers
	dw_const CeruleanBadgeHouseMiddleAgedManText, TEXT_CERULEANBADGEHOUSE_MIDDLE_AGED_MAN
	dw_const CeruleanBadgeHouseCuboneText,       TEXT_CERULEANBADGEHOUSE_CUBONE

CeruleanBadgeHouseCuboneText:
	text_far _LavenderCuboneHouseCuboneText
	text_asm
	ld a, CUBONE
	call PlayCry
	jp TextScriptEnd

CeruleanBadgeHouseMiddleAgedManText:
	text_asm
	CheckEvent EVENT_GOT_TM03
	jr nz, .got_item
	ld hl, .YouCanHaveThisText
	call PrintText
	lb bc, TM_AURORA_BEAM, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedTM03Text
	call PrintText
	SetEvent EVENT_GOT_TM03
	jr .done
.bag_full
	ld hl, .TM03NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, .TM03ExplanationText
	call PrintText
.done
	jp TextScriptEnd

.YouCanHaveThisText:
	text_far ViridianCityFisherYouCanHaveThisText
	text_end

.ReceivedTM03Text:
	text_far _CeruleanBadgeHouseReceivedTM03Text
	sound_get_item_2
	text_end

.TM03ExplanationText:
	text_far _CeruleanBadgeHouseTM03ExplanationText
	text_end

.TM03NoRoomText:
	text_far _CeruleanBadgeHouseTM03NoRoomText
	text_end
	
; 	text_asm
; 	ld hl, .Text
; 	call PrintText
; 	xor a
; 	ld [wCurrentMenuItem], a
; 	ld [wListScrollOffset], a
; .loop
; 	ld hl, .WhichBadgeText
; 	call PrintText
; 	ld hl, .BadgeItemList
; 	call LoadItemList
; 	ld hl, wItemList
; 	ld a, l
; 	ld [wListPointer], a
; 	ld a, h
; 	ld [wListPointer + 1], a
; 	xor a
; 	ld [wPrintItemPrices], a
; 	ld [wMenuItemToSwap], a
; 	ld a, SPECIALLISTMENU
; 	ld [wListMenuID], a
; 	call DisplayListMenuID
; 	jr c, .done
; 	ld hl, CeruleanBadgeHouseBadgeTextPointers
; 	ld a, [wCurItem]
; 	sub BOULDERBADGE
; 	add a
; 	ld d, $0
; 	ld e, a
; 	add hl, de
; 	ld a, [hli]
; 	ld h, [hl]
; 	ld l, a
; 	call PrintText
; 	jr .loop
; .done
; 	xor a
; 	ld [wListScrollOffset], a
; 	ld hl, .VisitAnyTimeText
; 	call PrintText
; 	jp TextScriptEnd

; .BadgeItemList:
; 	table_width 1
; 	db NUM_BADGES ; #
; 	db BOULDERBADGE
; 	db CASCADEBADGE
; 	db THUNDERBADGE
; 	db RAINBOWBADGE
; 	db SOULBADGE
; 	db MARSHBADGE
; 	db VOLCANOBADGE
; 	db EARTHBADGE
; 	db -1 ; end
; 	assert_table_length NUM_BADGES + 2

; .Text:
; 	text_far _CeruleanBadgeHouseMiddleAgedManText
; 	text_end

; .WhichBadgeText:
; 	text_far _CeruleanBadgeHouseMiddleAgedManWhichBadgeText
; 	text_end

; .VisitAnyTimeText:
; 	text_far _CeruleanBadgeHouseMiddleAgedManVisitAnyTimeText
; 	text_end

; CeruleanBadgeHouseBadgeTextPointers:
; 	table_width 2
; 	dw CeruleanBadgeHouseBoulderBadgeText
; 	dw CeruleanBadgeHouseCascadeBadgeText
; 	dw CeruleanBadgeHouseThunderBadgeText
; 	dw CeruleanBadgeHouseRainbowBadgeText
; 	dw CeruleanBadgeHouseSoulBadgeText
; 	dw CeruleanBadgeHouseMarshBadgeText
; 	dw CeruleanBadgeHouseVolcanoBadgeText
; 	dw CeruleanBadgeHouseEarthBadgeText
; 	assert_table_length NUM_BADGES

; CeruleanBadgeHouseBoulderBadgeText:
; 	text_far _CeruleanBadgeHouseBoulderBadgeText
; 	text_end

; CeruleanBadgeHouseCascadeBadgeText:
; 	text_far _CeruleanBadgeHouseCascadeBadgeText
; 	text_end

; CeruleanBadgeHouseThunderBadgeText:
; 	text_far _CeruleanBadgeHouseThunderBadgeText
; 	text_end

; CeruleanBadgeHouseRainbowBadgeText:
; 	text_far _CeruleanBadgeHouseRainbowBadgeText
; 	text_end

; CeruleanBadgeHouseSoulBadgeText:
; 	text_far _CeruleanBadgeHouseSoulBadgeText
; 	text_end

; CeruleanBadgeHouseMarshBadgeText:
; 	text_far _CeruleanBadgeHouseMarshBadgeText
; 	text_end

; CeruleanBadgeHouseVolcanoBadgeText:
; 	text_far _CeruleanBadgeHouseVolcanoBadgeText
; 	text_end

; CeruleanBadgeHouseEarthBadgeText:
; 	text_far _CeruleanBadgeHouseEarthBadgeText
; 	text_end
