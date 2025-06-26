
-- Colours !!
G.C.ECHIPS = { 0.8, 0.45, 0.85, 1 } -- temp color for echips

DaysDelusions.getHighlighted = function (tables, ignored)
    local cards = {}
    for i, table in pairs(tables) do
        if table.cards then
            for i2, card in pairs(table.highlighted) do
                if card and card ~= ignored and card.highlighted and not card.checked then
                    cards[#cards+1] = card
                    card.checked = true
                end
            end
        end
    end
    for i, card in pairs(cards) do card.checked = nil end
    return cards
end

DaysDelusions.areEqual = function (cards, ignored_keys, check) -- no idea if this function already exists.. im on a cruise with no internet
    if #cards < 1 then return true end --- todo: fix ;-;
    ignored_keys = ignored_keys or {hands_played_at_create = true, grm_status = true}
    check = check or { seal = true, edition = true}
    local base = cards[1]
    for i, card in pairs(cards) do
        -- for key, value in pairs(card) do
        --     if check[key] then
        --         if base[key] ~= value and not ignored_keys[key] then
        --             sendInfoMessage(key, "DaysDelusions")
        --             return false
        --         end
        --     end
        -- end
        local keys = {}
        if base.seal ~= card.seal then keys.seal = true end
        if not DaysDelusions.equalTables({card.edition, base.edition}, ignored_keys) then keys.edition = true end
        if not DaysDelusions.equalTables({card.ability, base.ability}, ignored_keys) then keys.ability = true end
        if base.config.center_key ~= card.config.center_key then keys.center_key = true end
        if base.config.card_key ~= card.config.card_key then keys.card_key = true end
        local fail = false
        for k, v in pairs(keys) do
            if v == true then
                -- sendInfoMessage(k, "DaysDelusions")
                fail = true
            end
        end
        if fail then return false end
    end
    return true
end

DaysDelusions.equalTables = function (tables, blacklist)
    for i, table in pairs(tables) do
        if type(table) ~= "function" then
            -- if type(table) ~= table or is_number(table) then
            --     if table ~= tables[1] then
            --         sendInfoMessage(table, "DaysDelusions")
            --         return false
            --     end
            -- end
            if (table == nil) ~= (tables[1] == nil) then
                return false
            end
            for key, value in pairs(table) do
                if type(value) ~= "function" and not blacklist[key] then
                    -- if value ~= tables[1][key] then return false end
                    if type(value) == "table" and not is_number(value) then
                        if not DaysDelusions.equalTables({value, tables[1][key]}) then return false end
                    else
                        if value ~= tables[1][key] then
                            -- if type(value) == "table" and is_number(value) then sendInfoMessage(to_number(key), "DaysDelusions") end
                            -- if type(value) ~= "table" then sendInfoMessage(key, "DaysDelusions") end
                            return false
                        end
                    end
                end
            end
        end
    end
    return true
end


is_number = is_number or function (x)
    if type(x) == 'number' then return true end
    return false
end

--- Talisman Support

to_big = to_big or function(num)
    return num
end

to_number = to_number or function(num)
    return num
end