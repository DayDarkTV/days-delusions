
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
        for key, value in pairs(card) do
            if check[key] then
                if base[key] ~= value and not ignored_keys[key] then
                    sendInfoMessage(key, "DaysDelusions")
                    return false
                end
            end
        end
        for key, value in pairs(card.ability) do
            if base.ability[key] ~= value and not ignored_keys[key] then
                sendInfoMessage(key, "DaysDelusions")
                return false
            end
        end
        if base.config.center_key ~= card.config.center_key then return false end
        if base.config.card_key ~= card.config.card_key then return false end
    end
    return true
end


--- Talisman Support

to_big = to_big or function(num)
    return num
end

to_number = to_number or function(num)
    return num
end