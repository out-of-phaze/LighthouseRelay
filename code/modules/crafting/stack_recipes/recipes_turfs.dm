/decl/stack_recipe/turfs
	abstract_type         = /decl/stack_recipe/turfs
	expected_product_type = /turf
	time                  = 5 SECONDS // Arbitrary value since turfs don't behave like objs in terms of w_class/time
	req_amount            = 5 * SHEET_MATERIAL_AMOUNT // Arbitrary value since turfs have no matter return weird matter values.
	one_per_turf          = TRUE

/decl/stack_recipe/turfs/can_make(mob/user)
	. = ..()
	if(.)
		var/turf/T = get_turf(user.loc)
		if(!istype(T) || !T.simulated || T.density)
			return FALSE
		if(T.is_open())
			to_chat(user, SPAN_WARNING("You cannot build on open space."))
			return FALSE
		if(!T.is_plating())
			to_chat(user, SPAN_WARNING("You cannot build this on top of existing flooring."))
			return FALSE
		return TRUE

// See req_amount above.
/decl/stack_recipe/turfs/update_req_amount()
	return

/decl/stack_recipe/turfs/spawn_result(mob/user, location, amount, decl/material/mat, decl/material/reinf_mat, paint_color)
	var/turf/build_turf = get_turf(location)
	if(!build_turf)
		return
	var/turf/result = build_turf.ChangeTurf(result_type)
	if(istype(result))
		result.set_turf_materials(MATERIAL_RECIPE_PARAMS)
	return result

/decl/stack_recipe/turfs/wall
	abstract_type         = /decl/stack_recipe/turfs/wall
	expected_product_type = /turf/wall
	category              = "walls"

/decl/stack_recipe/turfs/floor
	abstract_type         = /decl/stack_recipe/turfs/floor
	expected_product_type = /turf/floor/natural
	category              = "floors"
