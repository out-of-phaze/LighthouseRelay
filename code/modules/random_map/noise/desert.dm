/datum/random_map/noise/desert
	descriptor = "desert"
	smoothing_iterations = 3

/datum/random_map/noise/desert/replace_space
	descriptor = "desert (replacement)"
	target_turf_type = TRUE

/datum/random_map/noise/desert/get_map_char(var/value)
	return "<font color='#[value][value][value][value][value][value]'>[pick(list(",",".","'","`"))]</font>"

/datum/random_map/noise/desert/get_appropriate_path(var/value)
	var/val = min(9,max(0,round((value/cell_range)*10)))
	if(isnull(val)) val = 0
	switch(val)
		if(0 to 1)
			return /turf/floor/natural/sand/water
		else
			return /turf/floor/natural/sand

/datum/random_map/noise/desert/get_additional_spawns(var/value, var/turf/T)
	var/val = min(9,max(0,round((value/cell_range)*10)))
	if(isnull(val)) val = 0
	switch(val)
		if(2 to 3)
			if(prob(60))
				var/grass_path = pick(subtypesof(/obj/structure/flora/grass))
				new grass_path(T)
			if(prob(5))
				var/mob_type = pick(list(/mob/living/simple_animal/lizard, /mob/living/simple_animal/mouse, /mob/living/simple_animal/mouse/rat))
				new mob_type(T)
		if(5 to 6)
			if(prob(20))
				var/grass_path = pick(subtypesof(/obj/structure/flora/grass))
				new grass_path(T)
		if(7 to 9)
			if(prob(60))
				new /obj/structure/flora/bush(T)
			else if(prob(20))
				new /obj/structure/flora/tree/dead(T)
