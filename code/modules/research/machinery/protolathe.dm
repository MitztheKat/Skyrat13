/obj/machinery/rnd/production/protolathe
	name = "protolathe"
	desc = "Converts raw materials into useful objects."
	icon_state = "protolathe"
	circuit = /obj/item/circuitboard/machine/protolathe
	categories = list(
								"Power Designs",
								"Medical Designs",
								"Bluespace Designs",
								"Stock Parts",
								"Equipment",
								"Tool Designs",
								"Mining Designs",
								"Electronics",
								"Weapons",
								"Ammo",
								"Firing Pins",
								"Computer Parts"
								)
	production_animation = "protolathe_n"
	allowed_buildtypes = PROTOLATHE

/obj/machinery/rnd/production/protolathe/disconnect_console()
	linked_console.linked_lathe = null
	..()

/obj/machinery/rnd/production/protolathe/calculate_efficiency()
	. = ..()
	var/obj/item/circuitboard/machine/protolathe/C = circuit
	offstation_security_levels = C.offstation_security_levels

/obj/machinery/rnd/production/protolathe/offstation
	offstation_security_levels = FALSE
	circuit = /obj/item/circuitboard/machine/protolathe/offstation

/obj/machinery/rnd/production/protolathe/emag_act(mob/user)
	. = ..()
	obj_flags |= EMAGGED
	to_chat(user, "<span class='warning'>You unlock all the modules!</span>")
	allowed_department_flags = ALL
	return TRUE