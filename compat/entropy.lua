SMODS.Joker {
    key = "alilad",
    name = "Alilad",
    atlas = 'jokers',
    pos = { x = 2, y = 0 },
    soul_pos = { x = 1, y = 0 },
    dependencies = {
        items = {
          "set_entr_inversions"
        }
    },
    rarity = "entr_reverse_legendary",
    cost = 20,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {
        extra = { echips = 2 }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.echips } }
    end,
    calculate = function(self, card, context)
        if context.joker_main or context.forcetrigger then
            return {
                Echip_mod = card.ability.extra.echips,
				message = localize({
					type = "variable",
					key = "a_powchips",
					vars = { card.ability.extra.echips },
				}),
				colour = G.C.ECHIPS, --plasma colors
            }
        end
    end
}
DaysDelusions.mascot_jokers.j_ddu_alilad = "Alilad"