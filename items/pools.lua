--- Define the Mascot joker pool :>
SMODS.ObjectType({
    key = "Mascot",
    cards = {},
    default = "j_ddu_dalila",
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

SMODS.ObjectType({
    key = "Pet",
    cards = {},
    default = "j_lucky_cat",
    inject = function (self)
        SMODS.ObjectType.inject(self)
        for key, name in pairs(DaysDelusions.pet_jokers) do
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



-- Pool Compat --
if Cryptid then
    -- Load food jokers
    for key, name in pairs(DaysDelusions.food_jokers) do
        SMODS.Centers[key].pools = {["Food"] = true}
    end
    
    -- Load Meme Jokers
    for key, name in pairs(DaysDelusions.meme_jokers) do
        SMODS.Centers[key].pools = {["Meme"] = true}
    end
end
