;Generic Tutor
_MoveTutorWelcomeText::
	text "Hello, I am a"
	line "Move Tutor."
	
	para "For only ¥1000, I"
	line "can teach a move"
	cont "to one of your"
	cont "#mon."
	prompt
	
_TeachTutorMoveText::
	text "Teach a #mon"
	line "@"
	text_ram wStringBuffer
	db $0
	cont "for ¥1000?"
	done


; _TeachTutorMoveText::
; 	text "Want me to teach"
; 	line "@"
; 	text_ram wStringBuffer
; 	db $0
; 	cont "to a #mon?"
; 	done

_MoveTutorComeAgainText::
	text "Come again!"
	done

_MoveTutorNotEnoughMoneyText::
	text "I'm sorry, you"
	line "don't have enough"
	cont "money."
	done


;THIEF Tutor

_MoveTutorTHIEFIntroText::
	text "You got moxie kid!"
	line "I like that!"

	para "Tell ya what, how"
	line "about you let me"
	cont "teach one of your"
	cont "#mon a move?"
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
  
	para "You must really"
	line "like listening"
	cont "to chatter."
	prompt

;BRICK_BREAK Tutor

_MoveTutorBRICK_BREAKIntroText::
	text "Wow! You really"
	line "listened to that"
	cont "whole story?!"
  
	para "You must really"
	line "like listening"
	cont "to chatter."
	prompt