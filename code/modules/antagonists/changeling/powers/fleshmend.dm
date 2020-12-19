/obj/effect/proc_holder/changeling/fleshmend
	name = "Fleshmend"
		desc = "Our flesh will permanently heal slowly. Functions while unconscious."
	helptext = "If we are on fire, the healing effect will not function. Does not regrow limbs or restore lost blood, and beware that people might get suspicious of you healing out of nowhere."
	chemical_cost = 0
	loudness = 2
	dna_cost = 2
	req_stat = UNCONSCIOUS
	action_icon = 'icons/mob/actions/actions_changeling.dmi'
	action_icon_state = "ling_fleshmend"
	action_background_icon_state = "bg_ling"

//you gain a permanent healing buff
//Can be used whilst unconscious.
/obj/effect/proc_holder/changeling/fleshmend/sting_action(mob/living/user)
	if(user.has_status_effect(STATUS_EFFECT_FLESHMEND))
		to_chat(user, "<span class='warning'>We are already fleshmending!</span>")
		return
	to_chat(user, "<span class='notice'>We begin to heal rapidly.</span>")
	user.apply_status_effect(STATUS_EFFECT_FLESHMEND)
	return TRUE

//Check buffs.dm for the fleshmend status effect code
