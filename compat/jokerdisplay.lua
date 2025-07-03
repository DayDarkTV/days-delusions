local jd_def = JokerDisplay.Definitions -- You can assign it to a variable to use as shorthand

jd_def["j_ddu_dalila"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "x_chips" }
                -- { text = "20" }
            },
            border_colour = G.C.CHIPS
        }
    }
}
jd_def["j_ddu_erm"] = {
    text = {
        { ref_table = "card.joker_display_values", ref_value = "isNegative" },
        { ref_table = "card.ability.extra", ref_value = "slots" },
        { text = " Joker slots" }
    },
    text_config = { colour = G.C.DARK_EDITION },
    calc_function = function (card)
        card.joker_display_values.isNegative = card.ability.extra.slots < 0 and "" or "+"
    end
}
jd_def["j_ddu_moodboard"] = {
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "blueprint_compat", colour = G.C.RED },
        { text = ")" }
    },
    calc_function = function(card)
        local coppied_joker, coppied_debuff = JokerDisplay.calculate_blueprint_copy(card)
        card.joker_display_values.blueprint_compat = localize('k_incompatible')
        JokerDisplay.copy_display(card, coppied_joker, coppied_debuff)
    end,
    get_blueprint_joker = function (card)
        return G.jokers.cards[#G.jokers.cards]
    end
}
jd_def["j_ddu_alilad"] = {
    text = {
        {
            border_nodes = {
                { text = "^" },
                { ref_table = "card.ability.extra", ref_value = "echips" },
            },
            border_colour = { 0.8, 0.45, 0.85, 1 }
        },
    }
}
jd_def["j_ddu_programmer"] = {
    text = {
        {
            border_nodes = {
                { text = "+" },
                { ref_table = "card.ability", ref_value = "immutible" }
            },
            border_colour = G.C.MULT
        }
    }
}



-- Modded Joker Compat

jd_def["j_ast_facsimile"] = {

    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "blueprint_compat", colour = G.C.RED },
        { text = ")" }
    },

    calc_function = function(card)
        local coppied_joker, coppied_debuff = JokerDisplay.calculate_blueprint_copy(card)
        card.joker_display_values.blueprint_compat = localize('k_incompatible')
        JokerDisplay.copy_display(card, coppied_joker, coppied_debuff)
    end,

    -- coppied code from Blueprint
    -- Copies the Joker to the left of itself
    get_blueprint_joker = function (card)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                return G.jokers.cards[i - 1]
            end
        end
        return nil
    end
}

jd_def["j_cry_oldblueprint"] = {

    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "blueprint_compat", colour = G.C.RED },
        { text = ")" }
    },

    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },

    calc_function = function(card)
        local coppied_joker, coppied_debuff = JokerDisplay.calculate_blueprint_copy(card)
        card.joker_display_values.blueprint_compat = localize('k_incompatible')
        JokerDisplay.copy_display(card, coppied_joker, coppied_debuff)
        
        card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,

    -- coppied code from Blueprint
    -- Copies the Joker to the left of itself
    get_blueprint_joker = function (card)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                return G.jokers.cards[i + 1]
            end
        end
        return nil
    end
}