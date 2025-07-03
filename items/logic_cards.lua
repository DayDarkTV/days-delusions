--- AND Logic Card
--- if selected cards are all equivilant, duplicate each
SMODS.DDU_LOGIC {
    key = "and",
    pos = { x = 0, y = 0 },

    config = {
        select = 2,
    },
    loc_vars = function (self, info_queue, card)
        return { vars = {card.ability.select} }
    end,
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
--- OR logic card
--- 
SMODS.DDU_LOGIC {
    key = "or",
    pos = { x = 1, y = 0 },
}
--- NAND logic card
--- 
SMODS.DDU_LOGIC {
    key = "nand",
    pos = { x = 2, y = 0 },
}
--- NOR logic card
--- 
SMODS.DDU_LOGIC {
    key = "nor",
    pos = { x = 3, y = 0 },
}
--- XOR logic card
--- 
SMODS.DDU_LOGIC {
    key = "xor",
    pos = { x = 0, y = 1 },
}
--- XNOR logic card
--- 
SMODS.DDU_LOGIC {
    key = "xnor",
    pos = { x = 1, y = 1 },
}
--- NOT logic card
--- make selected playing card negative
SMODS.DDU_LOGIC {
    key = "not",
    pos = { x = 2, y = 1 },

    config = {
        select = 1,
    },
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.select } }
    end,
    can_use = function (self, card, area)
        return #DaysDelusions.getHighlighted({G.hand}) > 0
            and #DaysDelusions.getHighlighted({G.hand}) <= card.ability.select
    end,
    use = function (self, card, area)
        for i, c in pairs(DaysDelusions.getHighlighted({G.hand})) do
            c:set_edition({negative = true})
        end
    end
}
--- Buffer Tarot card
--- gives a random Logic card
SMODS.Consumable {
    key = "buffer",
    name = "Buffer",
    set = "Tarot",
    atlas = "placeholder",
    pos = { x = 0, y = 2 },
    cost = 3,
    config = { extra = 1 },
    loc_vars = function (self, info_queue, card)
        return { vars = {card.ability.extra} }
    end,
    can_use = function (self, card, area)
        return (card.area == G.consumeables and #G.consumeables.cards - 1
            or #G.consumeables.cards)
                < G.consumeables.config.card_limit
    end,
    use = function (self, card, area)
        local this = card or self
        G.E_MANAGER:add_event(Event({trigger = "after", delay = 0.4, func = function()
            play_sound("timpani")
            local card = create_card("Logic", G.consumeables, nil, nil, nil, nil, nil, "buffer")
            card:add_to_deck()
            G.consumeables:emplace(card)
            this:juice_up(0.3, 0.5)
            return true
        end}))
        delay(0.6)
    end
}