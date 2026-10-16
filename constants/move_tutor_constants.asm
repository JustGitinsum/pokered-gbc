; move tutor ids
; indexes for MoveTutorData (see data/move_tutors.asm)
; scripts load one of these into wWhichTrade before calling MoveTutorScript
	const_def 1
	const TUTOR_SWIFT        ; $01 Viridian School House
	const TUTOR_THIEF        ; $02 Mt. Moon B2F
	const TUTOR_BRICK_BREAK  ; $03 Vermilion City
	const TUTOR_CHATTER      ; $04 Vermilion Pokemon Fan Club
	const TUTOR_ZEN_HEADBUTT ; $05 Saffron Fighting Dojo
	const TUTOR_BODY_SLAM    ; $06 (unassigned)
	const TUTOR_BELCH        ; $07 S.S. Anne Kitchen
	const TUTOR_LUNGE        ; $08 (unassigned)
	const TUTOR_COUNTER      ; $09 Celadon Mart 3F
	const TUTOR_SUBSTITUTE   ; $0A Celadon City
	const TUTOR_HYPER_VOICE  ; $0B Viridian City
DEF NUM_MOVE_TUTORS EQU const_value - 1

; move tutor compatibility modes
; CanLearnTutorMove relies on these exact values
	const_def
	const TUTOR_ONLY   ; 0: only the listed species can learn the move
	const TUTOR_EXCEPT ; 1: every species except the listed ones can learn the move

; MoveTutorData entry fields (see data/move_tutors.asm)
	rsreset
DEF MOVE_TUTOR_MOVE          rb   ; move id
DEF MOVE_TUTOR_PRICE         rb 3 ; BCD, big endian
DEF MOVE_TUTOR_MODE          rb   ; TUTOR_ONLY or TUTOR_EXCEPT
DEF MOVE_TUTOR_SPECIES       rw   ; pointer to a -1-terminated species list
DEF MOVE_TUTOR_INTRO_TEXT    rw   ; text pointers
DEF MOVE_TUTOR_GOODBYE_TEXT  rw
DEF MOVE_TUTOR_NO_MONEY_TEXT rw
DEF MOVE_TUTOR_DATA_LENGTH EQU _RS
