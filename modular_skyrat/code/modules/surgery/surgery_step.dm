//Overrides the surgery step to require anasthetics for a smooth surgery
//also lets you do self-surgery again bottom text
/datum/surgery_step/initiate(mob/user, mob/living/target, target_zone, obj/item/tool, datum/surgery/surgery, try_to_fail = FALSE)
	surgery.step_in_progress = TRUE
	var/speed_mod = (user == target ? 0.25 : 1) //self-surgery is hard
	var/advance = FALSE
	var/obj/item/bodypart/affecting = target.get_bodypart(target_zone)
	if(preop(user, target, target_zone, tool, surgery) == -1)
		surgery.step_in_progress = FALSE
		return FALSE
	if(tool)
		speed_mod = tool.toolspeed
			
	if(do_after(user, time * speed_mod, target = target))
		var/prob_chance = 100
		if(target == user) //self-surgery is hard
			prob_chance *= 0.6
		if(!target.lying) //doing surgery on someone who's not even lying down is VERY hard
			prob_chance *= 0.5
		if(implement_type)	//this means it isn't a require hand or any item step.
			prob_chance = implements[implement_type]
		prob_chance *= surgery.get_probability_multiplier()
		
		if((prob(prob_chance) || (iscyborg(user) && !silicons_obey_prob)) && chem_check(target) && !try_to_fail)
			if(success(user, target, target_zone, tool, surgery))
				advance = TRUE
		else
			if(failure(user, target, target_zone, tool, surgery))
				advance = TRUE
		if(advance && !repeatable)
			surgery.status++
			if(surgery.status > surgery.steps.len)
				surgery.complete()
	surgery.step_in_progress = FALSE
	return advance
