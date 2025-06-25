DaysDelusions = DaysDelusions or {}
DaysDelusions.food_jokers = {}
DaysDelusions.meme_jokers = {}
DaysDelusions.mascot_jokers = {}


SMODS.load_file("utils.lua")()

SMODS.load_file("items/atlases.lua")()

--- Load Consumables
SMODS.load_file("items/consumable_types.lua")()

SMODS.load_file("items/logic_cards.lua")()


--- load jokers
SMODS.load_file("items/joker.lua")()

SMODS.load_file("items/pools.lua")()
--- start compat
if JokerDisplay then
    SMODS.load_file("compat/jokerdisplay.lua")()
end
if Cryptid then
    SMODS.load_file("compat/cryptid.lua")()
    if Entropy then
        SMODS.load_file("compat/entropy.lua")()
    end
end
