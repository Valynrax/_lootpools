local dataLoaded = false
local lootList = {}

---------------------------------------------
--THREADS------------------------------------
---------------------------------------------

Citizen.CreateThread(function()
    for k,v in pairs(Config.LootTables) do
        if type(v) == "table" then
            local newLootTable = lootTable()
            for x,y in pairs(v) do
                if x == 0 then
                    newLootTable.setIdentifier(y)
                else
                    local LootList = lootTable()
                    for h,j in pairs(y) do
                        if h == "Identifier" then
                            LootList.setIdentifier(j)
                        elseif h == "CollectAll" then
                            LootList.setCollect(j)
                        elseif h == "Quantity" then
                            LootList.setQuantity(j)
                        elseif h == "Probability" then
                            LootList.setProb(j)
                        elseif type(h) == "number" then
                            local LootItem = lootTable()
                            for u,i in pairs(j) do
                                if u == "Identifier" then
                                    LootItem.setIdentifier(i)
                                elseif u == "Quantity" then
                                    LootItem.setQuantity(i.min, i.max)
                                elseif u == "Probability" then
                                    LootItem.setProb(i)
                                end
                            end
                            LootList.addToPool(LootItem)
                        end
                    end
                    newLootTable.addToPool(LootList)
                end
            end
            table.insert(lootList, newLootTable)
        end
    end
    dataLoaded = true
end)

---------------------------------------------
--FUNCTIONS----------------------------------
---------------------------------------------

exports('rollLoot', function(type)
    while not dataLoaded do Citizen.Wait(10) end -- make sure the loot pools exist before even trying to roll them

    for k,v in pairs(lootList) do
        if v.getIdentifier() == type then
            local loot = v.rollPool()
            return loot
        end
    end
end)