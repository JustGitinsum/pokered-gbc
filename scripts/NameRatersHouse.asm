NameRatersHouse_Script:
	jp EnableAutoTextBoxDrawing

ResetNameRaterIntroOnMapChange::
	ld a, [wCurMap]
	ld hl, wNameRaterIntroMap
	cp [hl]
	ret z
	ld [hl], -1
	ret

; NameRatersHouseCheckMonOTScript:
; ; return carry if mon's OT name or OT ID do not match the player's
; 	ld hl, wPartyMonOT
; 	ld bc, NAME_LENGTH
; 	ld a, [wWhichPokemon]
; 	call AddNTimes
; 	ld de, wPlayerName
; 	ld c, NAME_LENGTH
; 	call .check_match_loop
; 	jr c, .no_match
; 	ld hl, wPartyMon1OTID
; 	ld bc, wPartyMon2 - wPartyMon1
; 	ld a, [wWhichPokemon]
; 	call AddNTimes
; 	ld de, wPlayerID
; 	ld c, $2
; .check_match_loop
; 	ld a, [de]
; 	cp [hl]
; 	jr nz, .no_match
; 	inc hl
; 	inc de
; 	dec c
; 	jr nz, .check_match_loop
; 	and a
; 	ret
; .no_match
; 	scf
; 	ret

NameRatersHouse_TextPointers:
	def_text_pointers
	dw_const NameRatersHouseNameRaterText, TEXT_NAMERATERSHOUSE_NAME_RATER

NameRatersHouseNameRaterText:
	text_asm
	call SaveScreenTilesToBuffer2
	ld a, [wCurMap]
	ld hl, wNameRaterIntroMap
	cp [hl]
	jr z, .skipIntro
	ld [hl], a
	ld hl, .IntroductionText
	call PrintText
	jr .showMenu
.skipIntro
	ld hl, .HowCanIHelpText
	call PrintText
.showMenu
	hlcoord 10, 0
	lb bc, 8, 8
	call TextBoxBorder
	hlcoord 12, 2
	ld de, .MenuText
	call PlaceString
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 11
	ld [wTopMenuItemX], a
	ld a, 3
	ld [wMaxMenuItem], a
	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	call UpdateSprites
	call HandleMenuInput
	push af
	call LoadScreenTilesFromBuffer2
	pop af
	bit B_PAD_B, a
	jr nz, .did_not_rename
	ld a, [wCurrentMenuItem]
	cp 1
	jp z, MoveRelearner
	cp 2
	jp z, MoveDeleter
	and a
	jr nz, .did_not_rename
	ld hl, .WhichPokemonText
	call PrintText
	xor a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wUpdateSpritesEnabled], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	jr c, .did_not_rename
	call GetPartyMonName2
	farcall DisplayNameRaterScreen
	jr c, .did_not_rename
	ld hl, .PokemonHasBeenRenamedText
.done
	call PrintText
	jp TextScriptEnd
.did_not_rename
	ld hl, .ComeAnyTimeYouLikeText
	jr .done

.MenuText:
	db "Rename"
	next "Relearn"
	next "Unlearn"
	next "See ya!@"

.IntroductionText:
	text_far _NameRatersHouseNameRaterIntroductionText
	text_end

.HowCanIHelpText:
	text_far _NameRatersHouseNameRaterHowCanIHelpText
	text_end

.WhichPokemonText:
	text_far _NameRatersHouseNameRaterWhichPokemonText
	text_end

.PokemonHasBeenRenamedText:
	text_far _NameRatersHouseNameRaterPokemonHasBeenRenamedText
	text_end

.ComeAnyTimeYouLikeText:
	text_far _NameRatersHouseNameRaterComeAnyTimeYouLikeText
	text_end
