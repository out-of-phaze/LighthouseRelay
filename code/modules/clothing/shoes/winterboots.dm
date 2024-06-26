/obj/item/clothing/shoes/winterboots
	name = "winter boots"
	desc = "Boots lined with 'synthetic' animal fur."
	icon = 'icons/clothing/feet/winterboots.dmi'
	material = /decl/material/solid/organic/leather
	matter = list(
		/decl/material/solid/organic/skin/fur = MATTER_AMOUNT_TRACE
	)
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE
	footstep_volume_mod = 0.8
	snow_slowdown_mod = -1
