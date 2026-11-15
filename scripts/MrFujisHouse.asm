MrFujisHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

MrFujisHouse_TextPointers:
	def_text_pointers
	dw_const MrFujisHouseSuperNerdText,     TEXT_MRFUJISHOUSE_SUPER_NERD
	dw_const MrFujisHouseLittleGirlText,    TEXT_MRFUJISHOUSE_LITTLE_GIRL
	dw_const MrFujisHousePsyduckText,       TEXT_MRFUJISHOUSE_PSYDUCK
	dw_const MrFujisHouseNidorinoText,      TEXT_MRFUJISHOUSE_NIDORINO
	dw_const MrFujisHouseMrFujiText,        TEXT_MRFUJISHOUSE_MR_FUJI
	dw_const MrFujisHouseMrFujiPokedexText, TEXT_MRFUJISHOUSE_POKEDEX

MrFujisHouseSuperNerdText:
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr nz, .rescued_mr_fuji
	ld hl, .MrFujiIsntHereText
	call PrintText
	jr .done
.rescued_mr_fuji
	ld hl, .MrFujiHadBeenPrayingText
	call PrintText
.done
	jp TextScriptEnd

.MrFujiIsntHereText:
	text_far _MrFujisHouseSuperNerdMrFujiIsntHereText
	text_end

.MrFujiHadBeenPrayingText:
	text_far _MrFujisHouseSuperNerdMrFujiHadBeenPrayingText
	text_end

MrFujisHouseLittleGirlText:
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr nz, .rescued_mr_fuji
	ld hl, .ThisIsMrFujisHouseText
	call PrintText
	jr .done
.rescued_mr_fuji
	ld hl, .PokemonAreNiceToHugText
	call PrintText
.done
	jp TextScriptEnd

.ThisIsMrFujisHouseText:
	text_far _MrFujisHouseLittleGirlThisIsMrFujisHouseText
	text_end

.PokemonAreNiceToHugText:
	text_far _MrFujisHouseLittleGirlPokemonAreNiceToHugText
	text_end

MrFujisHousePsyduckText:
	text_far _MrFujisHousePsyduckText
	text_asm
	ld a, PSYDUCK
	call PlayCry
	jp TextScriptEnd

MrFujisHouseNidorinoText:
	text_far _MrFujisHouseNidorinoText
	text_asm
	ld a, NIDORINO
	call PlayCry
	jp TextScriptEnd

MrFujisHouseMrFujiText:
	text_asm
	CheckEvent EVENT_GOT_POKE_FLUTE
	jr nz, .got_item
	ld hl, .IThinkThisMayHelpYourQuestText
	call PrintText
	lb bc, POKE_FLUTE, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedPokeFluteText
	call PrintText
	SetEvent EVENT_GOT_POKE_FLUTE
	; Only take the Scope after the Flute has been successfully given.
	ld b, SILPH_SCOPE
	call IsItemInBag
	jr z, .done
	ld hl, .TakeSilphScopeText
	call PrintText
	ld a, SILPH_SCOPE
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	ld hl, .SilphScopeRemovedText
	jr .printText
.bag_full
	ld hl, .PokeFluteNoRoomText
	jr .printText
.got_item
	ld hl, .HasMyFluteHelpedYouText
.printText
	call PrintText
.done
	jp TextScriptEnd

.IThinkThisMayHelpYourQuestText:
	text_far _MrFujisHouseMrFujiIThinkThisMayHelpYourQuestText
	text_end

.ReceivedPokeFluteText:
	text_far _MrFujisHouseMrFujiReceivedPokeFluteText
	sound_get_key_item
	text_far _MrFujisHouseMrFujiPokeFluteExplanationText
	text_end

.TakeSilphScopeText:
	text_far _MrFujisHouseMrFujiTakeSilphScopeText
	text_end

.SilphScopeRemovedText:
	text_far _MrFujisHouseSilphScopeRemovedText
	text_end

.PokeFluteNoRoomText:
	text_far _MrFujisHouseMrFujiPokeFluteNoRoomText
	text_end

.HasMyFluteHelpedYouText:
	text_far _MrFujisHouseMrFujiHasMyFluteHelpedYouText
	text_end

MrFujisHouseMrFujiPokedexText:
	text_far _MrFujisHouseMrFujiPokedexText
	text_end
