/obj/item/gun/projectile/mk58
	name = "\"Mk. 58\" pistol"
	desc = "A rugged combat handgun tailored for colonial security forces. Chambered in 9mm."
	icon = 'icons/obj/guns/projectile/mk58.dmi'
	icon_state = "mk58"
	item_state = "mk58"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6)
	price_tag = 450
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	can_dual = TRUE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_H_PISTOL|MAG_WELL_PISTOL
	damage_multiplier = 1.1
	penetration_multiplier = 0.9
	init_recoil = HANDGUN_RECOIL(0.9)
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_9MM, GUN_SILENCABLE, GUN_MAGWELL)
	serial_type = "H&S"

	wield_delay = 0.2 SECOND
	wield_delay_factor = 0.2 // 20 vig
	gun_parts = list(/obj/item/part/gun/frame/mk58 = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/part/gun/frame/mk58
	name = "Mk. 58 pistol frame"
	desc = "A combat pistol frame. It can make a regular Mk. 58 pistol or a Rose."
	icon_state = "frame_mk58"
	result = /obj/item/gun/projectile/mk58
	resultvars = list(/obj/item/gun/projectile/mk58, /obj/item/gun/projectile/mk58/wood)
	gripvars = list(/obj/item/part/gun/grip/black, /obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/pistol, /obj/item/part/gun/barrel/magnum)


/obj/item/gun/projectile/mk58/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_empty"
	else
		iconstring = initial(icon_state) + "_full"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/mk58/wood
	name = "\"Rose\" magnum pistol"
	desc = "A Mk. 58 combat pistol with an organic wooden grip and a cleaner finish, usually seen in the hands of the local church. Chambered in 10mm."
	icon = 'icons/obj/guns/projectile/mk58_wood.dmi'
	icon_state = "mk58"
	item_state = "mk58"
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 550
	mag_well = MAG_WELL_PISTOL
	caliber = CAL_MAGNUM
	damage_multiplier = 0.9
	init_recoil = HANDGUN_RECOIL(0.8)
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL)
	gun_parts = list(/obj/item/part/gun/frame/mk58 = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/magnum = 1)
	serial_type = "Absolute"


/obj/item/gun/projectile/mk58/wood/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_empty"
	else
		iconstring = initial(icon_state) + "_full"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)
