SMODS.Booster{
    key = "mascot_normal_1",
    name = "Mascot Pack",
    atlas = "placeholder",
    pos = {x = 0, y = 0},
    cost = 20,
    config = {extra = 3, choose = 1},
    group_key = "k_mascot_pack",
    draw_hand = false,
    weight = 0.25,
    kind = "mascot",
    create_card = function (self, card)
        return create_card("Mascot", G.pack_cards, nil, nil, true, true, nil, "ddu_mascotone")
    end,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card and card.ability.choose or self.config.choose,
                card and card.ability.extra or self.config.extra
            }
        }
    end
}
SMODS.Booster{
    key = "logic_normal_1",
    name = "Logic Pack",
    atlas = "placeholder",
    pos = {x = 0, y = 0},
    cost = 20,
    config = {extra = 3, choose = 1},
    group_key = "k_logic_pack",
    draw_hand = true,
    weight = 0.25,
    kind = "logic",
    create_card = function (self, card)
        return create_card("Logic", G.pack_cards, nil, nil, true, true, nil, "ddu_logicone")
    end,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card and card.ability.choose or self.config.choose,
                card and card.ability.extra or self.config.extra
            }
        }
    end
}