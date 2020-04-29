function lootTable()
    local self = {}

    self.identifier = nil
    self.probability = nil
    self.min = nil
    self.max = nil
    self.collectAll = nil
    self.LootPool = {}

    -- FUNCTIONS

    self.addToPool = function(obj)
        table.insert(self.LootPool, obj)
    end

    self.rollPool = function()
        local rollTable = {}
        local counter = 0

        for k,v in pairs(self.LootPool) do
            for i = 1, v.getProb() do
                table.insert(rollTable, k)
                counter = counter + 1
            end
        end

        if counter > 100 and Config.Debug then
            print("[^6_LootPools ^1WARN^0]: ^3Lootpool " .. self.identifier .. " Catgories exceeds 100% Probability.^0")
        end

        if counter > 100 and Config.CancelOverRolls then
            return nil
        end

        local CategoryRoll = math.random(1, counter) -- Uses counter to ensure exceeding 100% rolls can be successful

        local lootPool = self.LootPool[rollTable[CategoryRoll]]

        if lootPool.getCollectAll() then
            local loot = {}
            for k,v in pairs(lootPool) do
                if k == "LootPool" then
                    for x,y in pairs(v) do
                        table.insert(loot, {name = y.getIdentifier(), amount = math.random(y.getMin(), y.getMax())})
                    end
                end
            end

            return loot
        else
            for k,v in pairs(lootPool) do
                if k == "LootPool" then
                    if #v ~= 0 then
                        local roll = lootPool.rollPool() -- Recursively Roll (this roll will collect a single item)
                        return roll
                    else
                        local item = {}
                        table.insert(item, {name = lootPool.getIdentifier(), amount = math.random(lootPool.getMin(), lootPool.getMax())}) 
                        return item
                    end
                end
            end
        end

    end

    -- SETS
    self.setIdentifier = function(val)
        self.identifier = val
    end

    self.setQuantity = function(min, max)
        if max then
            self.min = min
            self.max = max
        else
            self.min = min
            self.max = min
        end
    end

    self.setCollect = function(val)
        self.collectAll = val
    end

    self.setProb = function(val)
        self.probability = val
    end

    -- GETS
    self.getIdentifier = function()
        return self.identifier
    end

    self.getProb = function()
        return self.probability
    end

    self.getCollectAll = function()
        return self.collectAll
    end

    self.getMin = function()
        return self.min
    end

    self.getMax = function()
        return self.max
    end

    return self
end