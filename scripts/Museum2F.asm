Museum2F_Script:
	jp EnableAutoTextBoxDrawing

Museum2F_TextPointers:
	def_text_pointers
	dw_const Museum2FYoungsterText,        TEXT_MUSEUM2F_YOUNGSTER
	dw_const Museum2FGrampsText,           TEXT_MUSEUM2F_GRAMPS
	dw_const Museum2FScientistText,        TEXT_MUSEUM2F_SCIENTIST
	dw_const Museum2FBrunetteGirlText,     TEXT_MUSEUM2F_BRUNETTE_GIRL
	dw_const Museum2FHikerText,            TEXT_MUSEUM2F_HIKER
	dw_const Museum2FSpaceShuttleSignText, TEXT_MUSEUM2F_SPACE_SHUTTLE_SIGN
	dw_const Museum2FMoonStoneSignText,    TEXT_MUSEUM2F_MOON_STONE_SIGN

Museum2FYoungsterText:
	text_far _Museum2FYoungsterText
	text_end

Museum2FGrampsText:
	text_far _Museum2FGrampsText
	text_end

Museum2FScientistText:
	text_far _Museum2FScientistText
	text_end

Museum2FBrunetteGirlText:
	text_asm
	call Museum2FCheckSpookTrade
	ld hl, Museum2FBrunetteGirlBeforeTradeText
	ret z
	ld hl, Museum2FBrunetteGirlAfterTradeText
	ret

Museum2FBrunetteGirlBeforeTradeText:
	text_far _Museum2FBrunetteGirlText
	text_end

Museum2FBrunetteGirlAfterTradeText:
	text_far _Museum2FBrunetteGirlAfterTradeText
	text_end

Museum2FHikerText:
	text_asm
	call Museum2FCheckSpookTrade
	jr nz, .afterTrade
	ld a, PIKACHU
	ld hl, wPartySpecies
	call IsInList
	jr nc, .normalText
	ld a, TRADE_FOR_SPOOK
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd
.normalText
	ld hl, Museum2FHikerNormalText
	ret
.afterTrade
	ld hl, Museum2FHikerAfterTradeText
	ret

Museum2FHikerNormalText:
	text_far _Museum2FHikerText
	text_end

Museum2FHikerAfterTradeText:
	text_far _Museum2FHikerAfterTradeText
	text_end

Museum2FCheckSpookTrade:
	push bc
	ld hl, wCompletedInGameTradeFlags
	ld c, TRADE_FOR_SPOOK
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	pop bc
	and a
	ret

Museum2FSpaceShuttleSignText:
	text_far _Museum2FSpaceShuttleSignText
	text_end

Museum2FMoonStoneSignText:
	text_far _Museum2FMoonStoneSignText
	text_end
