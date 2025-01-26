/obj/item/gun/projectile/automatic/ak47
	name = "Excelsior \"Kalashnikov\" rifle"
	desc = "\"We stand for organised terror. Terror is an absolute necessity during times of revolution.\"\
		 A proprietary carbine version of a classic AK rifle chambered for 7.62mm."
	icon = 'icons/obj/guns/projectile/ak.dmi'
	icon_state = "AK"
	item_state = "AK"
	item_suffix = ""
	excelsior = TRUE
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_RIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 1000
	fire_sound = 'sound/weapons/guns/fire/ak.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	damage_multiplier = 1.2 //the uncheap
	init_recoil = RIFLE_RECOIL(0.8)
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL)

	gun_parts = list(/obj/item/part/gun/frame/ak47 = 1, /obj/item/part/gun/grip/excel = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/lrifle = 1)

	init_firemodes = list(
		FULL_AUTO_300,
		SEMI_AUTO_NODELAY
		)
	serial_type = "EXC"

//AK-47 base-frame
/obj/item/part/gun/frame/ak47
	name = "AK frame"
	desc = "An AK rifle frame. The eternal firearm."
	icon_state = "frame_ak"
	matter = list(MATERIAL_PLASTEEL = 8)
	result = /obj/item/gun/projectile/automatic/ak47/sa
	gripvars = list(/obj/item/part/gun/grip/excel, /obj/item/part/gun/grip/wood, /obj/item/part/gun/grip/black, /obj/item/part/gun/grip/rubber)
	resultvars = list(/obj/item/gun/projectile/automatic/ak47, /obj/item/gun/projectile/automatic/ak47/sa, /obj/item/gun/projectile/automatic/ak47/NM_colony, /obj/item/gun/projectile/automatic/ak47/sa/tac)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle
	barrelvars = list(/obj/item/part/gun/barrel/lrifle)

/obj/item/gun/projectile/automatic/ak47/NM_colony
	name = "polymer \"Kalashnikov\" rifle"
	desc = "A carbine version of a classic AK rifle repurposed for in-colony use. Chambered in 7.62mm."
	excelsior = FALSE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	price_tag = 800
	serial_type = "NM"
	gun_parts = list(/obj/item/part/gun/frame/ak47 = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/lrifle = 1)

/obj/item/gun/projectile/automatic/ak47/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/ak47/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/automatic/ak47/saiga
	name = "Excelsior \"Saiga-12\" shotgun"
	desc = "\"You and your comrades have nothing to lose but your chains. You've a world to win.\"\nThis weapon takes after the AK rifle's design and turns it into a formidable shotgun. Chambered in 20mm."
	icon = 'icons/obj/guns/projectile/saiga12.dmi'
	icon_state = "saiga"
	item_state = "saiga"
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	excelsior = TRUE
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 9, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	mag_well = MAG_WELL_RIFLE|MAG_WELL_DRUM // Saigas do have drum mags
	init_recoil = RIFLE_RECOIL(1.3)
	serial_type = "EXC"
	gun_parts = list(/obj/item/part/gun/frame/saiga = 1, /obj/item/part/gun/grip/excel = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/shotgun = 1)

/obj/item/gun/projectile/automatic/ak47/saiga/NM_colony
	name = "\"Saiga-12\" shotgun"
	desc = "This weapon takes after the AK rifle's design and turns it into a formidable shotgun. Chambered in 20mm, this specific model was made in-colony."
	icon_state = "saiga-bs"
	item_state = "saiga-bs"
	penetration_multiplier = 0.9 //Non-Excelsior varient, it's powerful as is. Pug on crack.
	excelsior = FALSE
	origin_tech = list(TECH_COMBAT = 9, TECH_MATERIAL = 1)
	price_tag = 800
	serial_type = "NM"
	gun_parts = list(/obj/item/part/gun/frame/saiga = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/shotgun = 1)

//AK-47 base-frame
/obj/item/part/gun/frame/saiga
	name = "Saiga frame"
	desc = "An AK frame chambered in 20mm, for a shotgun."
	icon_state = "frame_ak"
	matter = list(MATERIAL_PLASTEEL = 8)
	result = /obj/item/gun/projectile/automatic/ak47/saiga
	gripvars = list(/obj/item/part/gun/grip/excel, /obj/item/part/gun/grip/black)
	resultvars = list(/obj/item/gun/projectile/automatic/ak47/saiga, /obj/item/gun/projectile/automatic/ak47/saiga/NM_colony)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle
	barrelvars = list(/obj/item/part/gun/barrel/shotgun)

/obj/item/gun/projectile/automatic/ak47/akl
	name = "\"AK-L\" laser rifle"
	desc = "\"I'm going to the one place that hasn't been corrupted by capitalism... SPACE!\"\
	A time and battle-tested AK pattern rifle, converted to fire specialized laser ammunition - in the vein of a cheesy 80's action movie."
	icon = 'icons/obj/guns/projectile/akl.dmi'
	icon_state = "AKL"
	item_state = "AKL"
	excelsior = FALSE
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_PLASTIC = 10, MATERIAL_SILVER = 10, MATERIAL_GOLD = 5)
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_MAGNET = 3, TECH_POWER = 5)
	price_tag = 1500
	init_recoil = RIFLE_RECOIL(0.4)
	damage_multiplier = 1.2 //We hold less ammo but deal about the same damage
	saw_off = FALSE
	caliber = CAL_SCI
	mag_well = MAG_WELL_LSRIFLE
	fire_sound = 'sound/weapons/energy/Laser.ogg'
	init_firemodes = list(
		FULL_AUTO_300,
		BURST_5_ROUND,
		SEMI_AUTO_NODELAY
		)
	serial_type = "SI"
	gun_parts = null

/obj/item/gun/projectile/automatic/ak47/sa
	name = "\"Kalashnikov\" rifle"
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
		 A time and battle-tested AKMN rifle, crude and outdated by today's standards. Chambered in 7.62mm."
	icon = 'icons/obj/guns/projectile/ak_wood.dmi'
	icon_state = "AK"
	item_state = "AK"
	excelsior = FALSE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 10)
	price_tag = 900
	init_recoil = RIFLE_RECOIL(0.9)
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/ak47/sa/sawn
	serial_type = "SA"
	gun_parts = list(/obj/item/part/gun/frame/ak47 = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/lrifle = 1)

/obj/item/gun/projectile/automatic/ak47/sa/sawn
	name = "sawn-off \"Kalashnikov\" rifle"
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
	A time and battle-tested AKMN rifle, crude and outdated by today's standards. Chambered in 7.62mm and haphazardly shortened. Rifle was fine."
	icon = 'icons/obj/guns/projectile/sawnoff/ak.dmi'
	icon_state = "AK"
	item_state = "AK"
	excelsior = FALSE
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_WOOD = 5)
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	price_tag = 800
	init_recoil = RIFLE_RECOIL(1)
	damage_multiplier = 1
	saw_off = FALSE
	serial_type = "SA"
	wield_delay = 0.8 SECOND
	wield_delay_factor = 0.2 // 20 vig for insta wield
	gun_parts = list(/obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/stack/material/plasteel = 2)

/obj/item/gun/projectile/automatic/ak47/sa/tac
	name = "\"Sigma\" Kalashnikov rifle"	//To make a play on both brainrot and the AK Alfa
	desc = "A time and battle-tested AKMN rifle turned into an aftermarket Ship of Theseus. Chambered in 7.62mm and optimized for \"tactical operations\", whatever the hell that means."
	icon = 'icons/obj/guns/projectile/ak_tact.dmi'
	icon_state = "AK"
	item_state = "AK"
	price_tag = 1250
	init_recoil = RIFLE_RECOIL(0.8)
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_PLASTIC = 15)
	saw_off = FALSE
	serial_type = "SA"
	gun_parts = list(/obj/item/part/gun/frame/ak47 = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/lrifle = 1)

	var/obj/item/gun/projectile/automatic/underslung/shotgun_3/shotgun
	init_firemodes = list(
		FULL_AUTO_300,
		SEMI_AUTO_NODELAY,
		list(mode_name="fire shotgun", mode_desc="Shoot the underbarrel shotgun",  burst=null, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)
	gun_parts = list(/obj/item/part/gun/frame/ak47 = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/lrifle = 1)

/obj/item/gun/projectile/automatic/ak47/sa/tac/Initialize()
	. = ..()
	shotgun = new(src)

/obj/item/gun/projectile/automatic/ak47/sa/tac/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	var/datum/firemode/cur_mode = firemodes[sel_mode]

	if(cur_mode.settings["use_launcher"])
		//We trigger like this three times, and then if nothing is inside the pistol swap back to are normal shotgun mode
		shotgun.Fire(target, user, params, pointblank, reflex)
		if(!shotgun.contents)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/automatic/ak47/sa/tac/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/ammo_casing/shotgun)))
		shotgun.load_ammo(I, user)
	else
		..()

/obj/item/gun/projectile/automatic/underslung/shotgun_3
	name = "underbarrel shotgun"
	desc = "An underbarrel shotgun chambered in 20mm."
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/shotgun_insert.ogg'
	w_class = ITEM_SIZE_NORMAL
	matter = null
	force = 5
	max_shells = 3
	init_recoil = RIFLE_RECOIL(1.2)
	safety = FALSE
	twohanded = FALSE
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun
	caliber = CAL_SHOTGUN
	handle_casings = EJECT_CASINGS
	serial_type = "SA"
	init_firemodes = list(
		list(mode_name = "semiauto",  mode_desc = "Fire as fast as you can pull the trigger", burst=1, fire_delay=2.5, move_delay=null, icon="semi"),
		)

/obj/item/gun/projectile/automatic/ak47/makeshift
	name = "Crude \"Kalashnikov\" rifle"
	desc = "A time and battle-tested AKMN rifle, crude and outdated by today's standards. Chambered in 7.62mm and manufactured with severe lack of concern for safety and sanity."
	icon = 'icons/obj/guns/projectile/ak_homemade.dmi'
	w_class = ITEM_SIZE_HUGE
	init_recoil = RIFLE_RECOIL(0.7)
	mag_well = MAG_WELL_RIFLE
	excelsior = FALSE
	gun_parts = list(/obj/item/part/gun = 3 ,/obj/item/stack/material/plasteel = 7)

	origin_tech = list(TECH_COMBAT = 2)	//bad copies don't give good science
	matter = list(MATERIAL_STEEL = 20, MATERIAL_WOOD = 10)
	damage_multiplier = 1.1
	penetration_multiplier = 0.8

	init_firemodes = list(
		SEMI_AUTO_NODELAY	//too poorly made for burst or automatic
	)
	matter = list(MATERIAL_STEEL = 22, MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 5, MATERIAL_WOOD = 12)
	price_tag = 500
	serial_type = "INDEX"
	serial_shown = FALSE
	gun_parts = list(/obj/item/part/gun/frame/kalash = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/autorifle/steel = 1, /obj/item/part/gun/barrel/lrifle/steel = 1)

/obj/item/gun/projectile/automatic/ak47/makeshift/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(ammo_magazine)
		add_overlay("_mag[ammo_magazine.max_ammo]")
	else
		cut_overlays()
		return

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/part/gun/frame/kalash
	name = "Crude Kalashnikov frame"
	desc = "A crudely made AK frame that likely works justt as good. The receiver can take either a 6.5mm or 7.62mm barrel."
	icon_state = "frame_kalash"
	matter = list(MATERIAL_STEEL = 10)
	resultvars = list(/obj/item/gun/projectile/automatic/ak47/makeshift)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle/steel
	barrelvars = list(/obj/item/part/gun/barrel/lrifle/steel, /obj/item/part/gun/barrel/srifle/steel)	//6.5mm or 7.62mm.
	nra = FALSE		//This controls if the weapon checks for barrels or not. If you want a gun to have MULTIPLE calibers that it can be chambered in, put FALSE.
