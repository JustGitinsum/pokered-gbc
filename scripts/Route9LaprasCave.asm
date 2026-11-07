Route9LaprasCave_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route9LaprasCaveTrainerHeaders
	ld de, Route9LaprasCave_ScriptPointers
	ld a, [wRoute9LaprasCaveCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute9LaprasCaveCurScript], a
	ret

Route9LaprasCave_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE9LAPRASCAVE_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE9LAPRASCAVE_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE9LAPRASCAVE_END_BATTLE

Route9LaprasCave_TextPointers:
	def_text_pointers
	dw_const Route9LaprasCaveLaprasText, TEXT_ROUTE9LAPRASCAVE_LAPRAS

Route9LaprasCaveTrainerHeaders:
	def_trainers
Route9LaprasCaveLaprasTrainerHeader:
	trainer EVENT_BEAT_ROUTE_9_LAPRAS, 0, Route9LaprasCaveLaprasBattleText, Route9LaprasCaveLaprasBattleText, Route9LaprasCaveLaprasBattleText
	db -1 ; end

Route9LaprasCaveLaprasText:
	text_asm
	ld hl, Route9LaprasCaveLaprasTrainerHeader
	call TalkToTrainer
	ld a, [wCurMapScript]
	ld [wRoute9LaprasCaveCurScript], a
	jp TextScriptEnd

Route9LaprasCaveLaprasBattleText:
	text "LAPRAS: Lapraa!@"
	text_asm
	ld a, LAPRAS
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
