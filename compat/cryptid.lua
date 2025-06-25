-- Load food jokers
for key, name in pairs(DaysDelusions.food_jokers) do
    SMODS.Centers[key].pools = {["Food"] = true}
end
-- Load Meme Jokers
for key, name in pairs(DaysDelusions.meme_jokers) do
    SMODS.Centers[key].pools = {["Meme"] = true}
end