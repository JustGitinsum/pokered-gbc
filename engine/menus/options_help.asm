; PrintText shares the option-cursor scratch RAM. Preserve the page/row on the
; stack, then rebuild the cursor choices from the synchronized saved options.
ShowOptionDescription::
	ld a, [wTopMenuItemY]
	ld b, a
	ld a, [wOptionsPage]
	ld c, a
	push bc
	ld a, b
	ld c, 0
.row
	sub 3
	jr c, .foundRow
	inc c
	jr .row
.foundRow
	ld a, [wOptionsPage]
	and a
	jr z, .descriptionIndex
	ld a, 5 ; five general settings precede the four case settings
.descriptionIndex
	add c
	add a
	ld e, a
	ld d, 0
	ld hl, .descriptions
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	call .waitRelease
	pop hl
	ld a, [wStatusFlags5]
	push af
	res BIT_NO_TEXT_DELAY, a
	ld [wStatusFlags5], a
	call PrintText
	pop af
	ld [wStatusFlags5], a
	call .waitRelease
	pop bc
	push bc
	ld a, c
	ld [wOptionsPage], a
	call SetCursorPositionsFromOptions
	call DrawOptionsPage
	pop bc
	ld a, b
	ld [wTopMenuItemY], a
	jp DrawSelectedOptionValues
.waitRelease
	call DelayFrame
	call Joypad
	ldh a, [hJoyHeld]
	and PAD_A | PAD_B
	jr nz, .waitRelease
	ret
.descriptions
	dw .textSpeed, .autoSave, .animation, .style, .nicknames
	dw .moves, .items, .pokemon, .trainers
.textSpeed
	text "Sets text speed."
	line "Fast also skips"
	cont "field prompts."
	prompt
.animation
	text "Turns battle move"
	line "animations on"
	cont "or off."
	prompt
.autoSave
	text "Saves on map entry"
	line "with no prompt."
	cont "Overwrites save."
	prompt
.style
	text "Shift offers swaps"
	line "when foes faint."
	cont "Set skips swaps."
	prompt
.nicknames
	text "Show: nicknames."
	line "Hide: species;"
	cont "skips nicknaming."
	prompt
.moves
	text "Sets move names to"
	line "UPPER or Lower."
	prompt
.items
	text "Sets item names to"
	line "UPPER or Lower."
	prompt
.pokemon
	text "Sets species case."
	line "Custom nicknames"
	cont "are not changed."
	prompt
.trainers
	text "Sets trainer case."
	line "Player-entered"
	cont "names keep case."
	prompt
