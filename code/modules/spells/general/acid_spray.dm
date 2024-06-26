/spell/acid_spray
	name = "Acid Spray"
	desc = "A common spell used to destroy basically anything in front of the wizard."
	school = "conjuration"
	feedback = "as"
	spell_flags = 0
	charge_max  = 600

	invocation = "Tagopar lethodar!"
	invocation_type = SpI_SHOUT
	var/reagent_type = /decl/material/liquid/acid/hydrochloric
	hud_state = "wiz_acid"
	cast_sound = 'sound/magic/disintegrate.ogg'

/spell/acid_spray/choose_targets()
	return list(holder)

/spell/acid_spray/cast(var/list/targets, var/mob/user)
	var/atom/target = targets[1]
	var/angle = dir2angle(target.dir)
	for(var/mod in list(315, 0, 45))
		var/obj/effect/effect/water/chempuff/chem = new(get_turf(target))
		chem.create_reagents(10)
		chem.add_to_reagents(reagent_type,10)
		spawn(0)
			chem.set_up(get_ranged_target_turf(target, angle2dir(angle+mod), 3))

/spell/acid_spray/tower
	desc = "The simplest form of aggressive conjuration: acid spray is quite effective in melting both man and object."
	charge_max = 2