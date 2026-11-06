TryFieldMove:: ; predef
	call GetPredefRegisters
	call TrySurf
	ret z
	jp TryCut

TrySurf:
	call CheckSurfRequirements
	jr nz, .no
	farcall IsSurfBlocked
	jr nc, .surfAllowed
	call InitializeFieldMoveTextBox
	farcall IsSurfingAllowed
	jr .no2
.surfAllowed
	ld hl, PromptToSurfText
	call ConfirmFieldMove
	jr nz, .no2
	ld a, [wWhichPokemon]
	cp $ff ; inventory fallback has no selected party Pokemon
	jr nz, .partySurf
	ld a, SEEL
	jr .surfSpecies
.partySurf
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
.surfSpecies
	ld [wSurfingPokemonID], a
	call GetSmartHMUserName
	ld a, SURFBOARD
	ld [wCurItem], a
	ld [wPseudoItemID], a
	call UseItem
.yes2
	call CloseFieldMoveTextBox
.yes
	xor a
	ret
.no2
	call CloseFieldMoveTextBox
.no
	ld a, 1
	and a
	ret

CheckSurfRequirements:
	ld a, [wWalkBikeSurfState]
	cp 2 ; is the player already surfing?
	jr z, TrySurf.no
	farcall IsNextTileShoreOrWater
	jr nc, TrySurf.no
	ld hl, TilePairCollisionsWater
	call CheckForTilePairCollisions2
	jr c, TrySurf.no
	lb de, SURF, 1 << BIT_SOULBADGE
	jp HasPartyFieldMove

TryCut:
	call IsCutTile
	jr nc, TrySurf.no
	call CheckCutRequirements
	jr nz, TrySurf.no2
	ld hl, PromptToCutText
	call ConfirmFieldMove
	jr nz, TrySurf.no2
.useCut
	call GetSmartHMUserName
	farcall Cut2
	jr TrySurf.yes2

TryFieldMoveOnBump::
; Silent auto-HMs are enabled only at FAST text speed.
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	ret nz
	ld a, [wChannelSoundIDs + CHAN5]
	cp SFX_COLLISION ; did the player just bump into something?
	ret nz
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz
	ld a, [wMovementFlags]
	bit BIT_LEDGE_OR_FISHING, a
	ret nz
	ldh a, [hJoyHeld]
	and PAD_CTRL_PAD
	ret z
	xor a
	ldh [hTextID], a
	call IsSpriteInFrontOfPlayer
	ldh a, [hTextID]
	and a
	ret nz
	; Player directions swap up/down relative to the joypad's high nibble.
	ASSERT PLAYER_DIR_DOWN << 4 == PAD_UP
	ASSERT PLAYER_DIR_UP << 4 == PAD_DOWN
	ASSERT PLAYER_DIR_LEFT << 4 == PAD_LEFT
	ASSERT PLAYER_DIR_RIGHT << 4 == PAD_RIGHT
	ld a, [wPlayerDirection]
	cp PLAYER_DIR_DOWN
	jr c, .gotDirection
	xor PLAYER_DIR_DOWN | PLAYER_DIR_UP
.gotDirection
	swap a
	ld b, a
	ldh a, [hJoyHeld]
	and b
	ret z
	call CheckTilePassable ; also updates wTileInFrontOfPlayer
	ret nc
	call IsCutTile
	jr c, .cut
	call CheckSurfRequirements
	ret nz
	farcall IsSurfBlocked
	ret c
	jp TrySurf.surfAllowed
.cut
	call CheckCutRequirements
	ret nz
	jp TryCut.useCut

CanAutoUseStrength::
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	ret nz
CheckStrengthRequirements::
	lb de, STRENGTH, 1 << BIT_RAINBOWBADGE
	jp HasPartyFieldMove

CheckCutRequirements:
	lb de, CUT, 1 << BIT_CASCADEBADGE
	; fall through

HasPartyFieldMove:
; Returns z for the badge and a party move, or its HM in the bag.
; Party users take priority; $ff in wWhichPokemon denotes the HM fallback.
	ld a, [wObtainedBadges]
	and e
	jp z, TrySurf.no
	call HasPartyMove
	ret z
	; HMMoves is in ROM0 and follows the HM item order, so no second table is needed.
	ld hl, HMMoves
	ld b, HM01
.findHM
	ld a, [hli]
	cp $ff
	jp z, TrySurf.no
	cp d
	jr z, .foundHM
	inc b
	jr .findHM
.foundHM
	call IsItemInBag
	jp z, TrySurf.no
	ld a, $ff
	ld [wWhichPokemon], a
	xor a
	ld [wWhichTrade], a
	ret
GetSmartHMUserName::
	ld a, [wWhichPokemon]
	cp $ff
	jp nz, GetPartyMonName2
	ld hl, wPlayerName
	ld de, wNameBuffer
	ld bc, NAME_LENGTH
	jp CopyData

IsCutTile:
; partial copy from UsedCut
	ld a, [wCurMapTileset]
	and a ; OVERWORLD
	jr z, .overworld
	cp GYM
	jr nz, .no
	ld a, [wTileInFrontOfPlayer]
	cp $50 ; gym cut tree
	jr nz, .no
	jr .yes
.overworld
	ld a, [wTileInFrontOfPlayer]
	cp $3d ; cut tree
	jr nz, .no
.yes
	scf
	ret
.no
	and a
	ret

HasPartyMove::
; Return z (optional: in wWhichTrade) if a PartyMon has move d.
; Updates wWhichPokemon.
	push bc
	push de
	push hl

	ld a, [wPartyCount]
	and a
	jr z, .no
	ld b, a
	ld c, 0
	ld hl, wPartyMons + (wPartyMon1Moves - wPartyMon1)
.loop
	ld e, NUM_MOVES
.check_move
	ld a, [hli]
	cp d
	jr z, .yes
	dec e
	jr nz, .check_move

	ld a, wPartyMon2 - wPartyMon1 - NUM_MOVES
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a

	inc c
	ld a, c
	cp b
	jr c, .loop
	jr .no

.yes
	ld a, c
	ld [wWhichPokemon], a
	xor a ; probably redundant
	ld [wWhichTrade], a
	jr .done
.no
	ld a, 1
	and a
	ld [wWhichTrade], a
.done
	pop hl
	pop de
	pop bc
	ret

ConfirmFieldMove:
; Returns z for YES or FAST text speed. Preserve the selected party Pokemon.
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	ret z
	ld a, [wWhichPokemon]
	push af
	push hl
	call InitializeFieldMoveTextBox
	pop hl
	call PrintText
	call YesNoChoice
	pop af
	ld [wWhichPokemon], a
	ld a, [wCurrentMenuItem]
	and a
	ret

InitializeFieldMoveTextBox:
	call EnableAutoTextBoxDrawing
	ld a, 1 ; not 0
	ldh [hTextID], a
	farjp DisplayTextIDInit

CloseFieldMoveTextBox:
	ld a,[hLoadedROMBank]
	push af
	jp CloseTextDisplay

PromptToSurfText:
	text "The water is calm."
	line "Would you like to"
	cont "SURF?@@"

; ExplainCutText:
; 	text "This tree can be"
; 	line "CUT!@@"

PromptToCutText:
	text "Would you like to"
	line "use CUT?@@"
