Config = {}

Config.Debug = true -- Will print out errors concerning %s and other data.
Config.CancelOverRolls = true -- Cancels probability rolls that exceed 100%.

Config.LootTables = {
    { -- Root of a singular Lootpool
        [0] = "Example Lootpool", -- Title of Lootpool, this is used in the export call; exports._lootpools:rollLoot("Example Lootpool")
        [1] = {
            ["Identifier"] = "Category 1", -- Name of Category
            ["Probability"] = 85, -- Chance this category will roll
            ["CollectAll"] = false, -- Decision to collect each piece of loot from specific category

            [0] = {
                ["Identifier"] = "C1 Item1", -- Item name, make sure this is an item.
                ["Probability"] = 80, -- Individual item probability if not a CollectAll
                ["Quantity"] = {min = 1, max = 3} -- min-max that can be tied to item
            },
            [1] = {
                ["Identifier"] = "C1 Item2",
                ["Probability"] = 15,
                ["Quantity"] = {min = 1, max = 2}
            },
            [2] = {
                ["Identifier"] = "C1 Item3",
                ["Probability"] = 5,
                ["Quantity"] = {min = 1, max = 2}
            }
        },
        [2] = {
            ["Identifier"] = "Category 2",
            ["Probability"] = 15,
            ["CollectAll"] = true,

            [0] = {
                ["Identifier"] = "C2 Item1",
                ["Probability"] = 80,
                ["Quantity"] = {min = 1, max = 1}
            },
            [1] = {
                ["Identifier"] = "C2 Item2",
                ["Probability"] = 20,
                ["Quantity"] = {min = 1, max = 1}
            },
        }
    }, -- End of a singular Lootpool

    -- Add more pools below here
}