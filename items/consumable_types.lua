SMODS.ConsumableType ({
    object_type = "ConsumableType",
    key = "Logic",
    primary_colour = G.C.CHIPS,
    secondary_colour = G.C.CHIPS,
    collection_rows = { 4, 4 },
    shop_rate = 0.0,
    loc_txt = {},
    default = "c_ddu_and"
})

SMODS.DDU_LOGIC = SMODS.Consumable:extend({
    set = "Logic",
    cost = 4,
    atlas = "ddu_logic",
})

DaysDelusions.amntUsed = function (set, ignore_keys)
    ignore_keys = ignore_keys or {}
    local amnt = 0
    for key, value in pairs(G.GAME.consumeable_usage) do
        if not ignore_keys[key] then
            if value.set and value.set == set then
                amnt = amnt + value.count
            end
        end
    end
    return amnt
end