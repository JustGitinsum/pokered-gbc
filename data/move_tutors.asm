; move_tutor move, price, mode, species list[, intro text[, goodbye text[, not enough money text]]]
;  - price: in ¥, up to 9999 (more digits would overflow the "Pay ¥____ to learn" line)
;  - mode:  TUTOR_ONLY   = only species in the list can learn the move
;           TUTOR_EXCEPT = every species except those in the list can learn the move
;  - list:  species constants terminated by -1, in any order
;  - texts: optional; omit or pass _ to use the generic text.
;           The intro only plays the first time you talk to the tutor after entering the map.
;           Custom texts must be declared with move_tutor_text below the table.
; Each move should appear only once in this table, because the party menu
; looks up compatibility by move rather than by tutor id.
MACRO move_tutor
	ASSERT (\2) <= 9999, "Move tutor price for \1 must be at most 9999 to fit _TeachTutorMoveText"
	db \1
	bcd3 \2
	db \3
	dw \4
	SHIFT 4
	_move_tutor_texts MoveTutorWelcomeText, MoveTutorComeAgainText, MoveTutorNotEnoughMoneyText, \#
ENDM

; \1-\3 = default texts, \4-\6 = optional overrides (missing, empty or _ = use the default)
MACRO _move_tutor_texts
	REPT 3
		IF _NARG < 4
			dw \1
		ELIF STRCMP("\4", "_") == 0 || STRLEN("\4") == 0
			dw \1
		ELSE
			dw \4
		ENDC
		SHIFT
	ENDR
ENDM

MoveTutorData:
	table_width MOVE_TUTOR_DATA_LENGTH
	move_tutor SWIFT,         2000, TUTOR_EXCEPT, SwiftTutorMons       ; Viridian School House
	move_tutor THIEF,         5000, TUTOR_EXCEPT, ThiefTutorMons, \
		MoveTutorTHIEFIntroText, MoveTutorTHIEFComeAgainText, MoveTutorTHIEFNotEnoughMoneyText ; Mt. Moon B2F
	move_tutor BRICK_BREAK,   5000, TUTOR_EXCEPT,   ThiefTutorMons, \
		MoveTutorBRICK_BREAKIntroText, MoveTutorBRICK_BREAKComeAgainText  ; Vermilion City
	move_tutor CHATTER,       4000, TUTOR_EXCEPT,   ThiefTutorMons, \
		MoveTutorCHATTERIntroText                                      ; Vermilion Pokemon Fan Club
	move_tutor ZEN_HEADBUTT,  7500, TUTOR_EXCEPT, SubstituteTutorMons, \
		MoveTutorZEN_HEADBUTTIntroText, MoveTutorBRICK_BREAKComeAgainText  ; Saffron Fighting Dojo
	move_tutor BODY_SLAM,     7500, TUTOR_EXCEPT, SubstituteTutorMons    ; (unassigned)
	move_tutor BELCH,         5000, TUTOR_EXCEPT,   ThiefTutorMons, \
		MoveTutorBELCHIntroText                                        ; S.S. Anne Kitchen
	move_tutor LUNGE,         8000, TUTOR_EXCEPT, SubstituteTutorMons       ; (unassigned)
	move_tutor COUNTER,       2000, TUTOR_ONLY,   CounterTutorMons     ; Celadon Mart 3F
	move_tutor SUBSTITUTE,    3000, TUTOR_EXCEPT, SubstituteTutorMons  ; Celadon City
	move_tutor HYPER_VOICE,   8000, TUTOR_EXCEPT, SubstituteTutorMons, \
		MoveTutorHYPER_VOICEIntroText                                      ; Viridian City
	assert_table_length NUM_MOVE_TUTORS
	db -1 ; end

; Custom tutor texts: each line points at _<Name> in text/move_tutor.asm
	move_tutor_text MoveTutorTHIEFIntroText
	move_tutor_text MoveTutorTHIEFComeAgainText
	move_tutor_text MoveTutorTHIEFNotEnoughMoneyText
	move_tutor_text MoveTutorCHATTERIntroText
	move_tutor_text MoveTutorBRICK_BREAKIntroText
	move_tutor_text MoveTutorBRICK_BREAKComeAgainText
	move_tutor_text MoveTutorZEN_HEADBUTTIntroText
	move_tutor_text MoveTutorBELCHIntroText
	move_tutor_text MoveTutorHYPER_VOICEIntroText

SwiftTutorMons: ; TUTOR_EXCEPT
	db CATERPIE, METAPOD, WEEDLE, KAKUNA, MAGIKARP, DITTO
	db GEODUDE, GRAVELER, GOLEM, ONIX, STEELIX
	db MACHOP, MACHOKE, MACHAMP, HITMONLEE, HITMONCHAN
	db GRIMER, MUK, SHELLDER, CLOYSTER, KRABBY, KINGLER
	db TYRUNT, TYRANTRUM
	db -1

ThiefTutorMons: ; TUTOR_EXCEPT
	db CATERPIE, METAPOD, WEEDLE, KAKUNA, MAGIKARP, DITTO
	db VOLTORB, ELECTRODE, MAGNEMITE, MAGNETON
	db SHELLDER, CLOYSTER, STARYU, STARMIE
	db -1

; BrickBreakTutorMons: ; TUTOR_ONLY
; 	db MACHOP, MACHOKE, MACHAMP, MANKEY, PRIMEAPE, ANNIHILAPE
; 	db HITMONLEE, HITMONCHAN, POLIWRATH, RIOLU, LUCARIO, GALLADE
; 	db CHARMANDER, CHARMELEON, CHARIZARD, SQUIRTLE, WARTORTLE, BLASTOISE
; 	db NIDOKING, NIDOQUEEN, RHYDON, KANGASKHAN, SNORLAX, GENGAR
; 	db ELECTABUZZ, MAGMAR, JYNX, MR_MIME, DROWZEE, HYPNO
; 	db CUBONE, MAROWAK, GEODUDE, GRAVELER, GOLEM, SANDSHREW, SANDSLASH
; 	db PSYDUCK, GOLDUCK, DRAGONITE, TYRUNT, TYRANTRUM, ZOROARK
; 	db CLEFAIRY, CLEFABLE, ARMAROUGE, CERULEDGE, KABUTOPS, SCIZOR
; 	db MEWTWO, MEW
; 	db -1

; ChatterTutorMons: ; TUTOR_ONLY
; 	db PIDGEY, PIDGEOTTO, PIDGEOT, SPEAROW, FEAROW, FARFETCHD
; 	db DODUO, DODRIO, MEW
; 	db -1

; ZenHeadbuttTutorMons: ; TUTOR_ONLY
; 	db ABRA, KADABRA, ALAKAZAM, SLOWPOKE, SLOWBRO, DROWZEE, HYPNO
; 	db MR_MIME, JYNX, EXEGGCUTE, EXEGGUTOR, PSYDUCK, GOLDUCK
; 	db RALTS, KIRLIA, GARDEVOIR, GALLADE, ARMAROUGE, STARMIE, PORYGON
; 	db SNORLAX, TAUROS, RHYHORN, RHYDON, KANGASKHAN, LICKITUNG
; 	db CHANSEY, CLEFAIRY, CLEFABLE, JIGGLYPUFF, WIGGLYTUFF
; 	db MANKEY, PRIMEAPE, ANNIHILAPE, POLIWRATH, RIOLU, LUCARIO
; 	db PONYTA, RAPIDASH, MEWTWO, MEW
; 	db -1

; BodySlamTutorMons: ; TUTOR_EXCEPT
; 	db CATERPIE, METAPOD, WEEDLE, KAKUNA, MAGIKARP, DITTO
; 	db BUTTERFREE, BEEDRILL, VENONAT, VENOMOTH, PARAS, PARASECT
; 	db SCYTHER, SCIZOR, PINSIR, KABUTO, OMANYTE
; 	db ZUBAT, GOLBAT, CROBAT, GASTLY, HAUNTER
; 	db ODDISH, GLOOM, VILEPLUME, BELLSPROUT, WEEPINBELL, VICTREEBEL
; 	db MAGNEMITE, MAGNETON, VOLTORB, ELECTRODE, KOFFING, WEEZING
; 	db ABRA, KADABRA, ALAKAZAM, EXEGGCUTE, PORYGON
; 	db TENTACOOL, TENTACRUEL, HORSEA, SEADRA, KINGDRA
; 	db STARYU, STARMIE, SHELLDER, CLOYSTER, GOLDEEN, SEAKING
; 	db KRABBY, KINGLER
; 	db -1

; BelchTutorMons: ; TUTOR_ONLY
; 	db SNORLAX, GRIMER, MUK, LICKITUNG, KOFFING, WEEZING
; 	db EKANS, ARBOK, SLOWPOKE, SLOWBRO, MEW
; 	db -1

; LungeTutorMons: ; TUTOR_ONLY
; 	db BUTTERFREE, BEEDRILL, VENONAT, VENOMOTH, PARAS, PARASECT
; 	db SCYTHER, SCIZOR, PINSIR, KABUTOPS, MEW
; 	db -1

CounterTutorMons: ; TUTOR_ONLY
	db MACHOP, MACHOKE, MACHAMP, MANKEY, PRIMEAPE, ANNIHILAPE
	db HITMONLEE, HITMONCHAN, POLIWRATH, RIOLU, LUCARIO, GALLADE
	db KANGASKHAN, SNORLAX, CHANSEY, LICKITUNG, TAUROS
	db CLEFAIRY, CLEFABLE, JIGGLYPUFF, WIGGLYTUFF
	db MR_MIME, JYNX, ELECTABUZZ, MAGMAR, DROWZEE, HYPNO
	db ABRA, KADABRA, ALAKAZAM, NIDOKING, NIDOQUEEN, RHYDON
	db CHARMANDER, CHARMELEON, CHARIZARD, SQUIRTLE, WARTORTLE, BLASTOISE
	db ZORUA, ZOROARK, MEWTWO, MEW
	db -1

SubstituteTutorMons: ; TUTOR_EXCEPT
	db CATERPIE, METAPOD, WEEDLE, KAKUNA, MAGIKARP, DITTO
	db -1

; HyperVoiceTutorMons: ; TUTOR_ONLY
; 	db JIGGLYPUFF, WIGGLYTUFF, CLEFAIRY, CLEFABLE, CHANSEY
; 	db KANGASKHAN, SNORLAX, MEOWTH, PERSIAN, MR_MIME
; 	db EEVEE, FLAREON, JOLTEON, VAPOREON, ZORUA, ZOROARK
; 	db RALTS, KIRLIA, GARDEVOIR, LAPRAS, GYARADOS, DRAGONITE
; 	db TYRUNT, TYRANTRUM, ZUBAT, GOLBAT, CROBAT
; 	db PIDGEOT, FEAROW, DODRIO, MOLTRES, ARTICUNO, ZAPDOS, MEW
; 	db -1
