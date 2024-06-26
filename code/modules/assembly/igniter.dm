/obj/item/assembly/igniter
	name = "igniter"
	desc = "A small electronic device able to ignite combustible substances."
	icon_state = "igniter"
	origin_tech = @'{"magnets":1}'
	material = /decl/material/solid/metal/steel
	matter = list(
		/decl/material/solid/fiberglass = MATTER_AMOUNT_REINFORCEMENT,
		/decl/material/solid/metal/copper = MATTER_AMOUNT_TRACE
	)

	secured = 1
	wires = WIRE_RECEIVE

/obj/item/assembly/igniter/activate()
	if(!..())	return 0//Cooldown check

	if(holder && istype(holder.loc,/obj/item/grenade/chem_grenade))
		var/obj/item/grenade/chem_grenade/grenade = holder.loc
		grenade.detonate()
	else
		var/turf/location = get_turf(loc)
		if(location)
			location.hotspot_expose(1000,1000)
		if (istype(src.loc,/obj/item/assembly_holder))
			if (istype(src.loc.loc, /obj/structure/reagent_dispensers/fueltank/))
				var/obj/structure/reagent_dispensers/fueltank/tank = src.loc.loc
				if(tank)
					tank.try_detonate_reagents()

		spark_at(src, cardinal_only = TRUE)

	return 1


/obj/item/assembly/igniter/attack_self(mob/user as mob)
	activate()
	add_fingerprint(user)
	return