_NameRatersHouseNameRaterIntroductionText::
	text "Hello, hello!"
	line "I am the official"
	cont "NAME RATER!"

	para "I can rename your"
	line "#MON, help em'"
	cont "remember moves,"
	cont "or forget moves!"

	para "How can I help?"
	prompt

_NameRatersHouseNameRaterHowCanIHelpText::
	text "How can I help?"
	prompt

_NameRatersHouseNameRaterWhichPokemonText::
	text "Which #MON"
	line "should I look at?"
	prompt

_NameRatersHouseNameRaterPokemonHasBeenRenamedText::
	text "OK! This #MON"
	line "has been renamed"
	cont "@"
	text_ram wBuffer
	text "!"

	para "That's a better"
	line "name than before!"
	done

_NameRatersHouseNameRaterComeAnyTimeYouLikeText::
	text "Fine! Come any"
	line "time you like!"
	done
