SMODS.Atlas {
    key = 'placeholder',
    path = 'placeholder.png',
	px = 71,
	py = 95
}
SMODS.Atlas {
    key = 'jokers',
    path = 'jokers.png',
	px = 71,
	py = 95
}

SMODS.Joker {
    key = 'dalila',
    name = 'Dalila',
    atlas = 'jokers',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = { x_chips = 20 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_chips } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return { x_chips = card.ability.extra.x_chips }
        end
    end,
}

DaysDelusions.mascot_jokers.j_ddu_dalila = "Dalila"