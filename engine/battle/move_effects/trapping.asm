ClearTrappingState:
	xor a
	ld [wPlayerTrapCounter], a
	ld [wEnemyTrapCounter], a
	ld [wPlayerTrappingMove], a
	ld [wEnemyTrappingMove], a
	ret

ApplyTrappingEffect:
	ld a, [wMoveMissed]
	and a
	ret nz
	ld a, [wAttackHitSubstitute]
	and a
	ret nz
	ld a, [wDamageMultipliers]
	and EFFECTIVENESS_MASK
	ret z
	farcall CheckTargetSubstitute
	ret nz
	ld hl, wEnemyMonHP
	ld de, wEnemyTrapCounter
	ld bc, wEnemyTrappingMove
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .gotTarget
	ld hl, wBattleMonHP
	ld de, wPlayerTrapCounter
	ld bc, wPlayerTrappingMove
	ld a, [wEnemyMoveNum]
.gotTarget
	push af
	ld a, [hli]
	or [hl]
	jr z, .failed
	ld a, [de]
	and a
	jr nz, .failed
	pop af
	ld [bc], a
	ld [wNamedObjectIndex], a
	push de
	call GetMoveName
	call CopyToStringBuffer
	farcall GetTrappingDuration
	ld a, d
	pop de
	ld [de], a
	ld hl, TrappedByMoveText
	jp PrintText
.failed
	pop af
	ret

CheckPlayerTrappedSwitch:
	ld a, [wPlayerTrapCounter]
	and a
	ret z
	ld hl, CantSwitchWhileTrappedText
	call PrintText
	ld a, 1
	and a
	ret

CheckTrappedTeleport:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	ld hl, wPlayerTrapCounter
	jr z, .gotUser
	ld a, [wEnemyMoveNum]
	ld hl, wEnemyTrapCounter
.gotUser
	cp TELEPORT
	jr z, .teleport
	xor a
	ret
.teleport
	ld a, [hl]
	and a
	ret

HandleTrappingEndTurn:
	ldh a, [hWhoseTurn]
	push af
	xor 1 ; process the first actor, then the second, identically on both link peers
	ldh [hWhoseTurn], a
	call .tick
	jr z, .done
	ldh a, [hWhoseTurn]
	xor 1
	ldh [hWhoseTurn], a
	call .tick
.done
	pop af
	ldh [hWhoseTurn], a
	ret

.tick
	ld hl, wBattleMonHP
	ld a, [hli]
	or [hl]
	jp z, ClearTrappingState
	ld hl, wEnemyMonHP
	ld a, [hli]
	or [hl]
	jp z, ClearTrappingState
	ld hl, wPlayerTrapCounter
	ld de, wPlayerTrappingMove
	ldh a, [hWhoseTurn]
	and a
	jr z, .gotVictim
	ld hl, wEnemyTrapCounter
	ld de, wEnemyTrappingMove
.gotVictim
	ld a, [hl]
	and a
	jr z, .alive
	push hl
	push de
	call PlayTrappingAnimation
	call TrappingDamage
	pop de
	push de
	ld a, [de]
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyToStringBuffer
	ld hl, HurtByTrappingMoveText
	call PrintText
	ld hl, wBattleMonHP
	ldh a, [hWhoseTurn]
	and a
	jr z, .checkHP
	ld hl, wEnemyMonHP
.checkHP
	ld a, [hli]
	or [hl]
	pop de
	pop hl
	jp z, ClearTrappingState
	dec [hl]
	jr nz, .alive
	xor a
	ld [de], a
	ld hl, ReleasedFromTrapText
	call PrintText
.alive
	ld a, 1
	and a
	ret

PlayTrappingAnimation:
	ld a, [de]
	ld [wAnimationID], a
	xor a
	ld [wAltAnimationID], a
	ld [wAnimationType], a
	ldh a, [hWhoseTurn]
	push af
	xor 1 ; move animations run from the attacker's perspective
	ldh [hWhoseTurn], a
	ld de, wPlayerMoveType
	and a
	jr z, .gotMoveType
	ld de, wEnemyMoveType
.gotMoveType
	ld a, [de]
	push af
	push de
	ld a, [wAnimationID]
	dec a
	ld hl, Moves + MOVE_TYPE
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld bc, 1
	ld a, BANK(Moves)
	call FarCopyData
	farcall PlayBattleAnimationGotID
	pop hl
	pop af
	ld [hl], a
	pop af
	ldh [hWhoseTurn], a
	ret

TrappingDamage:
	ld hl, wBattleMonMaxHP
	ld de, wBattleMonHP
	ldh a, [hWhoseTurn]
	and a
	jr z, .gotStats
	ld hl, wEnemyMonMaxHP
	ld de, wEnemyMonHP
.gotStats
	ld a, [hli]
	ld [wHPBarMaxHP + 1], a
	ld b, a
	ld a, [hl]
	ld [wHPBarMaxHP], a
	ld c, a
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	ld a, b
	or c
	jr nz, .subtract
	inc c
.subtract
	ld h, d
	ld l, e
	ld a, [hli]
	ld [wHPBarOldHP + 1], a
	ld a, [hl]
	ld [wHPBarOldHP], a
	sub c
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [hl]
	sbc b
	ld [hl], a
	ld [wHPBarNewHP + 1], a
	jr nc, .updateHPBar
	xor a
	ld [hli], a
	ld [hl], a
	ld [wHPBarNewHP], a
	ld [wHPBarNewHP + 1], a
.updateHPBar
	farcall UpdateCurMonHPBar
	farjp DrawHUDsAndHPBars

TrappedByMoveText:
	text_far _TrappedByMoveText
	text_end

HurtByTrappingMoveText:
	text_far _HurtByTrappingMoveText
	text_end

ReleasedFromTrapText:
	text_far _ReleasedFromTrapText
	text_end

CantSwitchWhileTrappedText:
	text_far _CantSwitchWhileTrappedText
	text_end
