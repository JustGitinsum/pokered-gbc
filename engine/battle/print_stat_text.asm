_PrintStatText:
; d: one-based stat-name index, passed through Bankswitch
	ld hl, StatModTextStrings
	ld c, "@"
.findStatName_outer
	dec d
	jr z, .foundStatName
.findStatName_inner
	ld a, [hli]
	cp c
	jr z, .findStatName_outer
	jr .findStatName_inner
.foundStatName
	ld de, wStringBuffer
	ld bc, $a
	jp CopyData

INCLUDE "data/battle/stat_mod_names.asm"
