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

SMODS.Joker {
    key = "moodboard",
    name = "Mood Board",
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers and G.jokers.cards then
            local other_joker = G.jokers.cards[#G.jokers.cards]
            local compatible = other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat
            local main_end = {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                            nodes = {
                                { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                            }
                        }
                    }
                }
            }
            return { main_end = main_end }
        end
    end,
    calculate = function(self, card, context)
        local other_joker = G.jokers.cards[#G.jokers.cards]
        if other_joker and other_joker ~= card then
            context.blueprint = (context.blueprint and (context.blueprint + 1) or 1)
            context.blueprint_card = context.blueprint_card or card

            if context.blueprint > #G.jokers.cards then
                return
            end

            local other_joker_ret, trig = other_joker:calculate_joker(context)
            local eff_card = context.blueprint_card or card

            context.blueprint = nil
            context.blueprint_card = nil

            if other_joker_ret == true then
                return other_joker_ret
            end
            if other_joker_ret or trig then
                if not other_joker_ret then
                    other_joker_ret = {}
                end
                other_joker_ret.card = eff_card
                other_joker_ret.colour = darken(G.C.BLUE, 0.3)
                other_joker_ret.no_callback = true
                return other_joker_ret
            end
        end
    end,
}

SMODS.Joker {
    key = 'erm',
    name = 'Erm',
    atlas = 'placeholder',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 20,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    config = { extra = -1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra } }
    end,
    add_to_deck = function(self, card, context)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra
    end,
    remove_from_deck = function(self, card, context)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra
    end,
}
DaysDelusions.meme_jokers.j_ddu_erm = "Erm"