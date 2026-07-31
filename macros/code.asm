; Syntactic sugar macros

MACRO lb ; r, hi, lo
	ld \1, ((\2) & $ff) << 8 + ((\3) & $ff)
ENDM

MACRO ldpal
	ld \1, \2 << 6 | \3 << 4 | \4 << 2 | \5
ENDM

; Design patterns

MACRO dict
	IF \1 == 0
		and a
	ELSE
		cp \1
	ENDC
	jp z, \2
ENDM

MACRO n_sub_a ; arg = which constant value a will be subtracted from. result a = arg - a
	cpl
	add \1 + 1
ENDM

; dereference the pointer argument into hl, if no argument just pull reference from hl
MACRO hl_deref
	IF _NARG > 0
		ld hl, \1
	ENDC
	ld a, [hli]
	ld h, [hl]
	ld l, a
ENDM

MACRO de_deref
	IF _NARG > 0
		ld hl, \1
	ENDC
	ld a, [hli]
	ld d, [hl]
	ld e, a
ENDM

MACRO inc_a_nc
	sbc -1
ENDM

MACRO dec_a_nc
	adc -1
ENDM

MACRO jp_bc
	push bc
	ret
ENDM

MACRO jp_de
	push de
	ret
ENDM