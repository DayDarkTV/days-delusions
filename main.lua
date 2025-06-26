DaysDelusions = DaysDelusions or {}
DaysDelusions.food_jokers = {}
DaysDelusions.meme_jokers = {}
DaysDelusions.mascot_jokers = {}
DaysDelusions.pet_jokers = {
    --- Vanilla ---
    j_lucky_cat = "Lucky Cat",
    
    --- Ortalab ---
    j_ortalab_black_cat = "Black Cat",

    --- Extra Credit ---
    j_ExtraCredit_rubberducky = "Rubber Ducky",
    j_ExtraCredit_corgi = "Toby the Corgi",
    j_ExtraCredit_turtle = "Turtle",

    --- SDM_0's Stuff ---
    j_sdm_ditto_joker = "Ditto Joker", -- not sure whether to count this tbh
}


SMODS.load_file("utils.lua")()

SMODS.load_file("items/atlases.lua")()

--- Load Consumables
SMODS.load_file("items/consumable_types.lua")()

SMODS.load_file("items/logic_cards.lua")()


--- load jokers
SMODS.load_file("items/joker.lua")()

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

SMODS.load_file("items/pools.lua")()

SMODS.load_file("items/boosters.lua")()