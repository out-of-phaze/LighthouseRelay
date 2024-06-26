/obj/item/stock_parts/circuitboard/unary_atmos
	board_type = "machine"
	additional_spawn_components = list(
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/keyboard = 1,
		/obj/item/stock_parts/power/apc/buildable = 1
	)

/obj/item/stock_parts/circuitboard/unary_atmos/construct(var/obj/machinery/atmospherics/unary/U)
	U.build(src)

/obj/item/stock_parts/circuitboard/unary_atmos/heater
	name = "circuitboard (gas heating system)"
	build_path = /obj/machinery/atmospherics/unary/heater
	origin_tech = @'{"powerstorage":2,"engineering":1}'
	req_components = list(
							/obj/item/stack/cable_coil = 5,
							/obj/item/stock_parts/matter_bin = 1,
							/obj/item/stock_parts/capacitor = 2)

/obj/item/stock_parts/circuitboard/unary_atmos/cooler
	name = "circuitboard (gas cooling system)"
	build_path = /obj/machinery/atmospherics/unary/freezer
	origin_tech = @'{"magnets":2,"engineering":2}'
	req_components = list(
							/obj/item/stack/cable_coil = 2,
							/obj/item/stock_parts/matter_bin = 1,
							/obj/item/stock_parts/capacitor = 2,
							/obj/item/stock_parts/manipulator = 1)
