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
	{text = 'NA SUA BOCA EU VIRO FRUTA, CHUPA QUE É DE UVA, FALA TRADE AI ABESTADO'}
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
	{ itemName = "battle stone", clientId = 11444, buy = 10 },
	{ itemName = "blazing bone", clientId = 10321, buy = 10 },
	{ itemName = "bloody pincers", clientId = 7786, buy = 10 },
	{ itemName = "brimstone fangs", clientId = 17823, buy = 10 },
	{ itemName = "brimstone shell", clientId = 5876, buy = 10 },
	{ itemName = "broken shamanic staff", clientId = 21194, buy = 10 },
	{ itemName = "compass", clientId = 11457, buy = 10 },
	{ itemName = "crawler head plating", clientId = 5877, buy = 10 },
	{ itemName = "crystallized anger", clientId = 5920, buy = 10 },
	{ itemName = "cultish mask", clientId = 10196, buy = 10 },
	{ itemName = "cultish robe", clientId = 11447, buy = 10 },
	{ itemName = "cyclops toe", clientId = 21200, buy = 10 },
	{ itemName = "damselfly wing", clientId = 9691, buy = 10 },
	{ itemName = "deepling warts", clientId = 21202, buy = 10 },
	{ itemName = "demon horn", clientId = 9654, buy = 10 },
	{ itemName = "demonic skeletal hand", clientId = 9657, buy = 10 },
	{ itemName = "draken sulphur", clientId = 22189, buy = 10 },
	{ itemName = "elven hoof", clientId = 10405, buy = 10 },
	{ itemName = "elven scouting glass", clientId = 11464, buy = 10 },
	{ itemName = "elvish talisman", clientId = 11464, buy = 10 },
	{ itemName = "energy vein", clientId = 18994, buy = 10 },
	{ itemName = "fairy wings", clientId = 10298, buy = 10 },
	{ itemName = "fiery heart", clientId = 9641, buy = 10 },
	{ itemName = "flask of embalming fluid", clientId = 11703, buy = 10 },
	{ itemName = "frazzle skin", clientId = 20199, buy = 10 },
	{ itemName = "frosty heart", clientId = 9635, buy = 10 },
	{ itemName = "gloom wolf fur", clientId = 11452, buy = 10 },
	{ itemName = "goosebump leather", clientId = 10309, buy = 10 },
	{ itemName = "green dragon leather", clientId = 9689, buy = 10 },
	{ itemName = "green dragon scale", clientId = 10279, buy = 10 },
	{ itemName = "hellspawn tail", clientId = 5883, buy = 10 }
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
