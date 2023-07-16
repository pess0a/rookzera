local itemTierClassifications = {
	-- Upgrade classification 1
	[1] = {
		-- Update tier 0
		[1] = {price = 2500},
		[2] = {price = 10000},
		[3] = {price = 25000},
		[4] = {price = 35000},
		[5] = {price = 45000}
	},
	-- Upgrade classification 2
	[2] = {
		-- Update tier 0
		[1] = {price = 2500},
		[2] = {price = 10000},
		[3] = {price = 25000},
		[4] = {price = 35000},
		[5] = {price = 45000}
		-- Update tier 1
	},
	-- Upgrade classification 3
	[3] = {
		[1] = {price = 2500},
		[2] = {price = 10000},
		[3] = {price = 25000},
		[4] = {price = 35000},
		[5] = {price = 45000}
	},
	-- Upgrade classification 4
	[4] = {
		[1] = {price = 2500},
		[2] = {price = 10000},
		[3] = {price = 25000},
		[4] = {price = 35000},
		[5] = {price = 45000}
	}
}

for classificationId, classificationTable in ipairs(itemTierClassifications) do
	local itemClassification = Game.createItemClassification(classificationId)
	local classification = {}

	-- Registers table for register_item_tier.lua interface
	classification.Upgrades = {}
	for tierId, tierTable in ipairs(classificationTable) do
		if tierId and tierTable.price then
			table.insert(classification.Upgrades, {TierId = tierId - 1, Price = tierTable.price})
		end
	end
	-- Create item classification and register classification table
	itemClassification:register(classification)
end
