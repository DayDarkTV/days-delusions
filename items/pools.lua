--- Define the Mascot joker pool :>
SMODS.ObjectType({
    key = "mascot",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
        for key, name in pairs(DaysDelusions.mascot_jokers) do
            local joker = nil
            if G.P_CENTERS[key] then
                joker = G.P_CENTERS[key]
            end
            if SMODS.Centers[key] then
                joker = SMODS.Centers[key]
            end
            if joker then
                self:inject_card(joker)
            end
        end
    end
})


-- Add jokers to Cryptid's Food joker pool
