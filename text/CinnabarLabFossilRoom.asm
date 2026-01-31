_CinnabarLabFossilRoomScientist1Text::
	text "Hiya!"

	para "I am important"
	line "doctor!"

	para "I study here rare"
	line "#MON fossils!"

	para "You! Have you a"
	line "fossil for me?"
	prompt

_CinnabarLabFossilRoomScientist1NoFossilsText::
	text "No! Is too bad!"
	done

_Route10FossilRoomScientist2Text::
	text "Welcome to our "
	line "lab!"

	para "Our machines are"
	line "less advanced"
	cont "then the Lab on"
	cont "CINNABAR ISLAND,"

	para "but if you want to"
	line "restore a fossil,"
	cont "we'd be happy to"
	cont "help!"
	done 

_CinnabarLabFossilRoomScientist1FossilIsBackToLifeText::
	text "Your fossil is"
	line "back to life!"

	para "It was @"
	text_ram wStringBuffer
	text_start
	line "like I think!"
	prompt

_CinnabarLabFossilRoomScientist1SeesFossilText::
	text "Oh! That is"
	line "@"
	text_ram wNameBuffer
	text "!"

	para "It is fossil of"
	line "@"
	text_ram wStringBuffer
	text ", a"
	cont "#MON that is"
	cont "already extinct!"

	para "My Resurrection"
	line "Machine will make"
	cont "that #MON live"
	cont "again!"
	done

_CinnabarLabFossilRoomScientist1TakesFossilText::
	text "So! You hurry and"
	line "give me that!"

	para "<PLAYER> handed"
	line "over @"
	text_ram wNameBuffer
	text "!"
	prompt

; _CinnabarLabFossilRoomScientist1GoForAWalkText2::
; 	text "I take a little"
; 	line "time!"

; 	para "You go for walk a"
; 	line "little while!"
; 	done

_CinnabarLabFossilRoomScientist1ComeAgainText::
	text "Aiyah! You come"
	line "again!"
	done
