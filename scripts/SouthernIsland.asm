SouthernIsland_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SouthernIslandTrainerHeaders
	ld de, SouthernIsland_ScriptPointers
	ld a, [wSouthernIslandCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSouthernIslandCurScript], a
	ret

SouthernIsland_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SOUTHERNISLAND_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SOUTHERNISLAND_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SOUTHERNISLAND_END_BATTLE

SouthernIsland_TextPointers:
	def_text_pointers
	dw_const SouthernIslandLatiosText, TEXT_SOUTHERNISLAND_LATIOS

SouthernIslandTrainerHeaders:
	assert SOUTHERNISLAND_LATIOS == 1
	def_trainers
SouthernIslandLatiosTrainerHeader:
	trainer EVENT_BEAT_SOUTHERN_ISLAND_LATIOS, 0, SouthernIslandLatiosBattleText, SouthernIslandLatiosBattleText, SouthernIslandLatiosBattleText
	db -1 ; end

SouthernIslandLatiosText:
	text_asm
	ld hl, SouthernIslandLatiosTrainerHeader
	call TalkToTrainer
	ld a, [wCurMapScript]
	ld [wSouthernIslandCurScript], a
	jp TextScriptEnd

SouthernIslandLatiosBattleText:
	text "LATIOS: ...@"
	text_asm
	ld a, LATIOS
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
