local mType = Game.createMonsterType("Minotaur Mage")
local monster = {}

monster.description = "a minotaur mage"
monster.experience = 150
monster.outfit = {
	lookType = 23,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 23
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 1000,
	FirstUnlock = 25,
	SecondUnlock = 500,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Cyclopolis, Mintwallin, Maze of Lost Souls, Dark Pyramid, Folda (hidden cave), \z
		Kazordoon (The Horned Fox's hideout), the Plains of Havoc, Point of No Return south of Outlaw Camp, \z
		Elvenbane, the depths of Fibula Dungeon (level 50+), cave east from Dwarf Bridge, Foreigner Quarter, \z
		Rookgaard Minotaur Hell (not reachable)."
	}

monster.health = 180
monster.maxHealth = 180
monster.race = "blood"
monster.corpse = 5981
monster.speed = 85
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Learrn tha secrret uf deathhh!", yell = false},
	{text = "Kaplar!", yell = false}
}

monster.loot = {
	{id = 2920, chance = 4950}, -- torch
	{name = "gold coin", chance = 85780, maxCount = 35},
	{name = "wand of cosmic energy", chance = 600},
	{name = "leather helmet", chance = 3000},
	{name = "leather legs", chance = 5190},
	{id = 3595, chance = 15003, maxCount = 8}, -- carrot
	{name = "minotaur leather", chance = 200},
	{name = "taurus mace", chance = 100},
	{name = "mana potion", chance = 100},
	{name = "minotaur horn", chance = 300, maxCount = 2},
	{name = "purple robe", chance = 100, maxCount = 2}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -20},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -50, maxDamage = -105, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -105, range = 7, radius = 1, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="energyfield", interval = 2000, chance = 10, range = 7, radius = 1, shootEffect = CONST_ANI_ENERGYBALL, target = true}
}

monster.defenses = {
	defense = 15,
	armor = 15
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
