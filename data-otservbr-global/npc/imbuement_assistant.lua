local internalNpcName = "Imbuement Assistant"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 141,
	lookHead = 41,
	lookBody = 72,
	lookLegs = 39,
	lookFeet = 96,
	lookAddons = 3,
	lookMount = 688
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{text = 'Hello adventurer, looking for Imbuement items? Just ask me!'}
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

-- Basic

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Currently I have been working selling items for imbuement."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to Imbuement's shop!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and come again.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and come again.")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "protective charm", clientId = 11444, buy = 10 },
	{ itemName = "mammoth tusk", clientId = 10321, buy = 10 },
	{ itemName = "orc tusk", clientId = 7786, buy = 10 },
	{ itemName = "piece of swampling wood", clientId = 17823, buy = 10 },
	{ itemName = "lizard leather", clientId = 5876, buy = 10 },
	{ itemName = "slime heart", clientId = 21194, buy = 10 },
	{ itemName = "dragon's tail", clientId = 11457, buy = 10 },
	{ itemName = "green dragon leather", clientId = 5877, buy = 10 },
	{ itemName = "green dragon scale", clientId = 5920, buy = 10 },
	{ itemName = "orc tooth", clientId = 10196, buy = 10 },
	{ itemName = "Orcish Gear", clientId = 11477, buy = 10 },
	{ itemName = "battle stone", clientId = 11447, buy = 10 },
    { itemName = "lion's mane", clientId = 9691, buy = 10 },
	{ itemName = "terrorbird beak", clientId = 10273, buy = 10 },
	{ itemName = "Moohtant Horn", clientId = 21200, buy = 10 },
	{ itemName = "cyclops toe", clientId = 9657, buy = 10 },
	{ itemName = "Bloody Pincers", clientId = 9633, buy = 10 },
	{ itemName = "ogre nose ring", clientId = 22189, buy = 10 },
	{ itemName = "piece of scarab shell", clientId = 9641, buy = 10 },
	{ itemName = "coal", clientId = 12600, buy = 10 },
	{ itemName = "War Crystal", clientId = 9654, buy = 10 },
	{ itemName = "broken crossbow", clientId = 11451, buy = 10 },
	{ itemName = "hunter's quiver", clientId = 11469, buy = 10 },
	{ itemName = "metal spike", clientId = 10298, buy = 10 },
	{ itemName = "Ghoul Snack", clientId = 11467, buy = 10 },
	{ itemName = "Vampire Teeth", clientId = 9685, buy = 10 },
	{ itemName = "Vampire Lord Token", clientId = 8192, buy = 10 },
	{ itemName = "swampling moss", clientId = 17822, buy = 10 },
	{ itemName = "carniphila seeds", clientId = 10300, buy = 10 },
	{ itemName = "lump of earth", clientId = 10305, buy = 10 },
	{ itemName = "rope belt", clientId = 11492, buy = 10 },
	{ itemName = "fiery heart", clientId = 9636, buy = 10 },
	{ itemName = "eternal flames", clientId = 946, buy = 10 },
	{ itemName = "polar bear paw", clientId = 9650, buy = 10 },
	{ itemName = "shard", clientId = 7290, buy = 10 },
	{ itemName = "frosty heart", clientId = 9661, buy = 10 },
	{ itemName = "broken shamanic staff", clientId = 11452, buy = 10 },
	{ itemName = "demonic skeletal hand", clientId = 9647, buy = 10 },
	{ itemName = "elder bonelord tentacle", clientId = 10276, buy = 10 },
	{ itemName = "Energy Vein", clientId = 23508, buy = 10 },
	{ itemName = "geomancer's staff", clientId = 11463, buy = 10 },
	{ itemName = "energy net", clientId = 9150, buy = 10 },
	{ itemName = "bunch of troll hair", clientId = 9689, buy = 10 },
	{ itemName = "piece of crocodile leather", clientId = 10279, buy = 10 },
	{ itemName = "ape fur", clientId = 5883, buy = 10 }
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)