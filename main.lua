DaysDelusions = DaysDelusions or {}
DaysDelusions.food_jokers = {}
DaysDelusions.meme_jokers = {}
DaysDelusions.mascot_jokers = {}


SMODS.load_file("utils.lua")()


--- load jokers
SMODS.load_file("items/joker.lua")()

--- start compat
if JokerDisplay then
    SMODS.load_file("compat/jokerdisplay.lua")()
end

SMODS.load_file("items/pools.lua")()