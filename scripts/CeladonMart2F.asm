CeladonMart2F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMart2F_TextPointers:
	def_text_pointers
	dw_const CeladonMart2FClerk1Text,           TEXT_CELADONMART2F_CLERK1
	dw_const CeladonMart2FClerk2Text,           TEXT_CELADONMART2F_CLERK2
	dw_const CeladonMart2FMiddleAgedManText,    TEXT_CELADONMART2F_MIDDLE_AGED_MAN
	dw_const CeladonMart2FGirlText,             TEXT_CELADONMART2F_GIRL
	dw_const CeladonMart2FCurrentFloorSignText, TEXT_CELADONMART2F_CURRENT_FLOOR_SIGN

CeladonMart2FMiddleAgedManText:
	text_far _CeladonMart2FMiddleAgedManText
	text_end

CeladonMart2FGirlText:
	text_far _CeladonMart2FGirlText
	text_end

CeladonMart2FCurrentFloorSignText:
	text_far _CeladonMart2FCurrentFloorSignText
	text_end

CeladonMart2FClerk1Text:
	script_mart GREAT_BALL, SUPER_POTION, REVIVE, SUPER_REPEL, ANTIDOTE, BURN_HEAL, ICE_HEAL, AWAKENING, PARLYZ_HEAL

CeladonMart2FClerk2Text:
	text_asm
	call MartTMClerkDialogue
	jp TextScriptEnd ; PureRGB - rst TextScriptEnd
;	script_mart ICE_PUNCH, TM_REFLECT, TM_AIR_SLASH, TM_HORN_DRILL, TM_THUNDERPUNCH, TM_AERIAL_ACE, TM_MEGA_KICK, TM_TAKE_DOWN, TM_SUBMISSION

MartTMClerkDialogue: ; marcelnote - this fills the TM seller list dynamically
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld hl, wItemList + 1 ; 1st entry = total number of items in the list, so we skip it for now
; start checking TMs one by one
	ld de, DynamicTMSellerConditions
	ld a, [wObtainedBadges]
	ld b, a             ; b contains the byte of obtained badges
	ld c, TM_AERIAL_ACE ; c will contain the current TM id
.loop
	ld a, [de] ; condition for current TM
	cp -2
	jr z, .checkIfChampion ; if a = -2
	jr nc, .finish         ; if a = -1
	and b ; has required badge?
	jr z, .skipTM
.addTM
	ld [hl], c
	inc hl
.skipTM
	inc c  ; next TM
	inc de ; next condition
	jr .loop

.checkIfChampion
	CheckEvent EVENT_BECAME_CHAMPION
	jr z, .skipTM
	jr .addTM

.finish
	ld [hl], -1 ; add list terminator
; recovering the final number of TMs in the list to put as first entry of wItemList
	ld a, l  ; address after last item (can ignore high byte because list length is < $FF)
	ld hl, wItemList
	sub l    ; a - l - 1 is the final number of items
	dec a    ; counted terminator address so one too many
	ld [hl], a
; loading text
	ld hl, PokemartGreetingText
	call PrintText
	ld a, PRICEDITEMLISTMENU
	ld [wListMenuID], a
	callfar DisplayPokemartDialogue_
	ret

; marcelnote - this list indicates which badge is needed to buy each TM
;              -2 means you need to have become champion
DynamicTMSellerConditions:
	db 1 << BIT_CASCADEBADGE ; TM01 MEGA_PUNCH (default list)
	db 1 << BIT_SOULBADGE    ; TM02 RAZOR_WIND (was on default list but not anymore)
	db -2                    ; TM03 SWORDS_DANCE ; elite 4
	db 1 << BIT_CASCADEBADGE ; TM04 WHIRLWIND
	db 1 << BIT_CASCADEBADGE ; TM05 MEGA_KICK (default list)
	db 1 << BIT_VOLCANOBADGE ; TM06 TOXIC
	db 1 << BIT_CASCADEBADGE ; TM07 HORN_DRILL (default list)
	db 1 << BIT_RAINBOWBADGE ; TM08 BODY_SLAM
	db 1 << BIT_CASCADEBADGE ; TM09 TAKE_DOWN (default list)
	db 1 << BIT_MARSHBADGE   ; TM10 DOUBLE_EDGE
	db 1 << BIT_RAINBOWBADGE ; TM11 BUBBLEBEAM
	db 1 << BIT_CASCADEBADGE ; TM12 WATER_GUN
	db 1 << BIT_EARTHBADGE   ; TM13 ICE_BEAM
	db -2                    ; TM14 BLIZZARD ; elite 4
	db -2                    ; TM15 HYPER_BEAM ; elite 4
	db 1 << BIT_MARSHBADGE   ; TM16 PAY_DAY
	db 1 << BIT_CASCADEBADGE ; TM17 SUBMISSION (default list)
	db 1 << BIT_MARSHBADGE   ; TM18 COUNTER
	db 1 << BIT_RAINBOWBADGE ; TM19 SEISMIC_TOSS
	db 1 << BIT_SOULBADGE    ; TM20 RAGE
	db 1 << BIT_EARTHBADGE   ; TM21 MEGA_DRAIN
	db -2                    ; TM22 SOLARBEAM ; elite 4
	db 1 << BIT_RAINBOWBADGE ; TM23 DRAGON_RAGE
	db 1 << BIT_VOLCANOBADGE ; TM24 THUNDERBOLT
	db -2                    ; TM25 THUNDER ; elite 4
	db -2                    ; TM26 EARTHQUAKE ; elite 4
	db -2                    ; TM27 FISSURE ; elite 4
	db 1 << BIT_RAINBOWBADGE ; TM28 DIG
	db 1 << BIT_EARTHBADGE   ; TM29 PSYCHIC_M
	db 1 << BIT_THUNDERBADGE ; TM30 TELEPORT
	db 1 << BIT_VOLCANOBADGE ; TM31 MIMIC
	db 1 << BIT_CASCADEBADGE ; TM32 DOUBLE_TEAM (default list)
	db 1 << BIT_CASCADEBADGE ; TM33 REFLECT (default list)
	db 1 << BIT_RAINBOWBADGE ; TM34 BIDE
	db 1 << BIT_VOLCANOBADGE ; TM35 METRONOME
	db 1 << BIT_VOLCANOBADGE ; TM36 SELFDESTRUCT
	db 1 << BIT_CASCADEBADGE ; TM37 EGG_BOMB (default list)
	db -2                    ; TM38 FIRE_BLAST ; elite 4
	db 1 << BIT_SOULBADGE    ; TM39 SWIFT
	db 1 << BIT_MARSHBADGE   ; TM40 SKULL_BASH
	db 1 << BIT_VOLCANOBADGE ; TM41 SOFTBOILED
	db 1 << BIT_RAINBOWBADGE ; TM42 DREAM_EATER
	db -2                    ; TM43 SKY_ATTACK ; elite 4
	db 1 << BIT_EARTHBADGE   ; TM44 REST
	db 1 << BIT_THUNDERBADGE ; TM45 THUNDER_WAVE
	db 1 << BIT_EARTHBADGE   ; TM46 PSYWAVE
	db -2                    ; TM47 EXPLOSION ; elite 4
	db 1 << BIT_MARSHBADGE   ; TM48 ROCK_SLIDE
	db 1 << BIT_VOLCANOBADGE ; TM49 TRI_ATTACK
	db -2                    ; TM50 SUBSTITUTE ; elite 4
	db -1 ; end
