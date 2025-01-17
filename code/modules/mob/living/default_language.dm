/mob/living
	var/datum/language/default_language

//CHOMPEdit Start 515 and tgui list
/mob/living/verb/set_default_language()
	set name = "Set Default Language"
	set category = "IC"

	var/language = tgui_input_list(usr, "Select your default language", "Available languages", languages)

	apply_default_language(language)


// Silicons can't neccessarily speak everything in their languages list
/mob/living/silicon/set_default_language()
	var/language = tgui_input_list(usr, "Select your default language", "Available languages", speech_synthesizer_langs)
	// Silicons have no species language usually. So let's default them to GALCOM
	if(!language)
		to_chat(src, "<span class='notice'>You will now speak your standard default language, common, if you do not specify a language when speaking.</span>")
		for(var/datum/language/lang in speech_synthesizer_langs)
			if(lang.name == LANGUAGE_GALCOM)
				default_language = lang
				break
		return
	apply_default_language(language)

/mob/living/proc/apply_default_language(var/language)
	if (only_species_language && language != GLOB.all_languages[src.species_language])
		to_chat(src, "<span class='notice'>You can only speak your species language, [src.species_language].</span>")
		return 0

	if(language == GLOB.all_languages[src.species_language])
		to_chat(src, "<span class='notice'>You will now speak your standard default language, [language ? language : "common"], if you do not specify a language when speaking.</span>")
	else if (language)

		if(language && !can_speak(language))
			to_chat(src, "<span class='notice'>You are unable to speak that language.</span>")
			return

		to_chat(src, "<span class='notice'>You will now speak [language] if you do not specify a language when speaking.</span>")
	else
		to_chat(src, "<span class='notice'>You will now speak whatever your standard default language is if you do not specify one when speaking.</span>")
	default_language = language

//CCHOMPEdit End
/mob/living/verb/check_default_language()
	set name = "Check Default Language"
	set category = "IC"

	if(default_language)
		to_chat(src, "<span class='notice'>You are currently speaking [default_language] by default.</span>")
	else
		to_chat(src, "<span class='notice'>Your current default language is your species or mob type default.</span>")
