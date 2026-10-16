; Per-tutor intro / goodbye / not enough money texts:
;  1. add _MoveTutor<NAME>...Text:: here
;  2. add "move_tutor_text MoveTutor<NAME>...Text" in data/move_tutors.asm
;  3. pass MoveTutor<NAME>...Text to that tutor's move_tutor entry

;Generic Tutor
_MoveTutorWelcomeText::
	text "Hello, I am a"
	line "Move Tutor."

	para "For a small fee,"
	line "I can teach a"
	cont "move to one of"
	cont "your #MON."
	prompt

_TeachTutorMoveText::
	text "Pay ¥@"
	text_bcd wPriceTemp, 3 | LEADING_ZEROES | LEFT_ALIGN
	text " to learn"
	line "@"
	text_ram wStringBuffer
	text "?"
	done

_MoveTutorComeAgainText::
	text "Come again!"
	done

_MoveTutorNotEnoughMoneyText::
	text "You don't have"
	line "enough money."
	done


;THIEF Tutor

_MoveTutorTHIEFIntroText::
	text "You got moxie kid!"
	line "I like that!"

	para "Tell ya what, how"
	line "about I teach one"
	cont "of your #MON a"
	cont "move..."
	para "for a price?"
	prompt

_MoveTutorTHIEFComeAgainText::
	text "Ya got the right"
	line "stuff, kid!"
	done

_MoveTutorTHIEFNotEnoughMoneyText::
	text "Kid, I like ya but"
	line "you aint got the"
	cont "money."
	done

;CHATTER Tutor

_MoveTutorCHATTERIntroText::
	text "Wow! You really"
	line "listened to that"
	cont "whole story?!"

	para "You may be ready"
	line "for #MON Fan"
	cont "Club special move!"
	prompt

;BRICK_BREAK Tutor

_MoveTutorBRICK_BREAKIntroText::
	text "Ready to break"
	line "some bricks?"

	para "I can teach one"
	line "of your #MON a"
	cont "powerful move..."
	prompt

_MoveTutorBRICK_BREAKComeAgainText::
	text "Keep training!"
	line "Come back soon!"
	done

;ZEN_HEADBUTT Tutor

_MoveTutorZEN_HEADBUTTIntroText::
	text "You have defeated"
	line "my pupils,"
	cont "and now you are"
	cont "ready to learn"
	cont "my ultimate"
	cont "technique!"
	prompt

;BELCH Tutor

_MoveTutorBELCHIntroText::
	text "With the Chef's"
	line "Special I have"
	cont "learned to harness"
	cont "my own special"
	cont "move!"

	para "Would your #MON"
	line "like to try the"
	cont "Chef's Special?"
	prompt

;HYPER_VOICE Tutor

_MoveTutorHYPER_VOICEIntroText::
	text "I like to come"
	line "out here to"
	cont "practice singing."

	para "Would any of your"
	line "#MON like to"
	cont "join me?"
	prompt