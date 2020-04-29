# _lootpools

`_lootpools` is a dev resource that allows for the % based rolling of "items".

## Support

I will not be providing any support, however you are free to create issues and pull requests. "How do I's..." will be closed. 

## Installation

1. Clone _lootpools to your resource directory
2. Add `start _lootpools` to your server.cfg
3. Add `_lootpools` as a dependency on whichever resource(s)
4. Configure the `config.lua` to your liking
5. Call export `rollLoot` in the following fashion `variable = exports._lootpools:rollLoot("Example Lootpool")`
6. run `variable` inside a loop to extract any number of items.
7. Send data to wherever you need it using `.name` and `.amount`

## Data

Items that are produced from rolling loot are as follows;
`.name` = String
`.amount` = Number

## Example server snippet

```
local loot = exports._lootpools:rollLoot("Example Lootpool")
for k,v in pairs(loot) do
  print(v.name, v.amount)
end
```

## Future

Considering changing it from a `%` based loot roll to a `weight` based roll
