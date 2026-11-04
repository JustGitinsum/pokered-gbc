; Keep the original joypad update after the optional save.
AutoSaveAndReadJoypad::
	call AutoSaveOnMapChange
	jp Joypad

; Called after map scripts at a completed walking step, covering warps and connections.
; Track maps even when disabled so enabling Auto Save does not save in-place.
AutoSaveOnMapChange::
	ld a, [wLinkState]
	and a
	ret nz
	ld a, [wStatusFlags4]
	and (1 << BIT_LINK_CONNECTED) | (1 << BIT_INIT_SCRIPTED_MOVEMENT)
	ret nz
	ld a, [wIsInBattle]
	and a
	ret nz
	ld a, [wWalkCounter]
	and a
	ret nz
	ld a, [wJoyIgnore]
	and a
	ret nz
	; Escort cleanup uses transient NPC-script state that a save cannot restore.
	; Leave the map pending until the entire script (not just one walk) ends.
	call IsPlayerCharacterBeingControlledByGame
	ret nz
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, [wStatusFlags3]
	bit BIT_WARP_FROM_CUR_SCRIPT, a
	ret nz
	ld a, [wStatusFlags6]
	and (1 << BIT_FLY_WARP) | (1 << BIT_DUNGEON_WARP)
	ret nz
	ld a, [wCurMap]
	ld b, a
	ld a, [wAutoSaveLastMap]
	cp b
	ret z
	ld c, a
	ld a, b
	ld [wAutoSaveLastMap], a
	; The first overworld update after boot/new game establishes a baseline only.
	ld a, c
	cp $ff
	ret z
	ld a, [wNameCaseOptions]
	bit BIT_AUTO_SAVE, a
	ret z
	; No prompts, delays, or save jingle; this is the same full writer as manual save.
	callfar SaveSAVtoSRAM
	ret

PUSHS
; A five-byte thunk fits a ROM0 gap; the normal farcall would overflow "Home".
SECTION "Auto Save Home", ROM0
AutoSaveBankswitch::
	ld b, BANK(AutoSaveAndReadJoypad)
	jp Bankswitch

SECTION "Auto Save RAM", WRAM0
wAutoSaveLastMap:: db
POPS
