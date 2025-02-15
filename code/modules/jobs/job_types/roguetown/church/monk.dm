/datum/job/roguetown/monk
	title = "Acolyte"
	flag = MONK
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 4
	spawn_positions = 4

	allowed_races = RACES_ALL_KINDS
	allowed_patrons = ALL_DIVINE_PATRONS
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/roguetown/monk
	tutorial = "Chores, some more chores- Even more chores.. Oh how the life of a humble cleric is exhausting… You have faith, but even you know you gave up a life of adventure for that of the security in the Church. Assist the Priest in their daily tasks, maybe today will be the day something interesting happens."

	display_order = JDO_MONK
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/monk
	name = "Acolyte"
	jobtype = /datum/job/roguetown/monk
	allowed_patrons = ALL_DIVINE_PATRONS

/datum/outfit/job/roguetown/monk/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltl = /obj/item/roguekey/church
	switch(H.patron?.type)
		if(/datum/patron/divine/astrata)
			head = /obj/item/clothing/head/roguetown/roguehood/astrata
			neck = /obj/item/clothing/neck/roguetown/psicross/astrata
			wrists = /obj/item/clothing/wrists/roguetown/wrappings
			shoes = /obj/item/clothing/shoes/roguetown/sandals
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/astrata
		if(/datum/patron/divine/noc) //Nocalytes aren't real. Play Cleric.
			head = /obj/item/clothing/head/roguetown/roguehood/nochood
			neck = /obj/item/clothing/neck/roguetown/psicross/noc
			wrists = /obj/item/clothing/wrists/roguetown/nocwrappings
			shoes = /obj/item/clothing/shoes/roguetown/sandals
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/noc
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
		if(/datum/patron/divine/dendor) //Dendorites all busted. Play Druid.
			head = /obj/item/clothing/head/roguetown/helmet/dendorculthelm
			neck = /obj/item/clothing/neck/roguetown/psicross/dendor
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
		if(/datum/patron/divine/necra) //disabled and moved unto gravedigger, but code supports it
			head = /obj/item/clothing/head/roguetown/roguehood/necracolytehood
			neck = /obj/item/clothing/neck/roguetown/psicross/necra
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/trou/leather/mourning
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/necra
		if(/datum/patron/divine/pestra) //PLEASE add leper gear later, this SUCKS dude
			head = /obj/item/clothing/head/roguetown/roguehood
			mask = /obj/item/clothing/mask/rogue/surgmask
			neck = /obj/item/clothing/neck/roguetown/psicross/pestra
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/tights/black
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
		if(/datum/patron/divine/eora) //Eora content from Stonekeep
			head = /obj/item/clothing/head/roguetown/eoramask
			neck = /obj/item/clothing/neck/roguetown/psicross/eora
			shoes = /obj/item/clothing/shoes/roguetown/sandals
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/eora
		if(/datum/patron/divine/xylix)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/xylixcagehelm
			neck = /obj/item/clothing/neck/roguetown/psicross/xylix
			shoes = /obj/item/clothing/shoes/roguetown/sandals
			pants = /obj/item/clothing/under/roguetown/loincloth
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
		if(/datum/patron/divine/malum)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/malumhelm
			neck = /obj/item/clothing/neck/roguetown/psicross/malum
			pants = /obj/item/clothing/under/roguetown/trou/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots
			armor =	/obj/item/clothing/suit/roguetown/armor/leathervest
		if(/datum/patron/divine/abyssor)
			head = /obj/item/clothing/head/roguetown/helmet/abyssorhat
			neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
			pants = /obj/item/clothing/under/roguetown/tights/purple
			armor =	/obj/item/clothing/suit/roguetown/shirt/robe/abyssoracorobe
			shoes = /obj/item/clothing/shoes/roguetown/boots
		if(/datum/patron/divine/ravox)
			head = /obj/item/clothing/head/roguetown/roguehood/flagellanthood
			neck = /obj/item/clothing/neck/roguetown/psicross/ravox
			pants = /obj/item/clothing/under/roguetown/loincloth
			shoes = shoes = /obj/item/clothing/shoes/roguetown/sandals
			shirt =	/obj/item/clothing/suit/roguetown/shirt/undershirt/ravoxrobe			
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, rand(3, 4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 1)
		H.change_stat("perception", -1)
		H.cmode_music = 'sound/music/combat_clergy.ogg'
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)

	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
