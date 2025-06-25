SMODS.Consumable {
    key = "and",
    set = "Logic",
    altlas = "placeholder",
    pos = { x = 0, y = 0 },
    cost = 4,
    hidden = true,
    config = {
        select = 2,
    },
    can_use = function (self, card, area)
        local numbed = #DaysDelusions.getHighlighted({G.hand}) > 0 and #DaysDelusions.getHighlighted({G.hand}) <= card.ability.select
        local are_equal = DaysDelusions.areEqual(DaysDelusions.getHighlighted({G.hand}))
        return numbed and are_equal
    end,
    use = function (self, card, area)
        for i, c in pairs(DaysDelusions.getHighlighted({G.hand})) do
            local nc = copy_card(c, nil)
            nc:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, nc)
            G.hand:emplace(nc)
            nc.states.visible = nil
            G.E_MANAGER:add_event(Event({
                func = function ()
                    nc:start_materialize()
                    return true
                end
            }))
        end
    end
}