if Cryptid then
    SMODS.Back {
        key = "day_dev",
        atlas = "ddu_placeholder",
        pos = { x = 0, y = 0 },
        config = {
            consumables = {'c_cry_pointer'}
        },
        calculate = function (self, back, context)
            if not context.using_consumeable then return end
            if DaysDelusions.contains(G.consumeables, "c_cry_pointer") then return end
            if not G.consumeables or not G.consumeables.cards then return end
            local newp = create_card("Spectral", G.consumeables, nil, nil, true, true, "c_cry_pointer", "ddu_dev")
            newp:add_to_deck()
            G.consumeables:emplace(newp)
        end
    }
end