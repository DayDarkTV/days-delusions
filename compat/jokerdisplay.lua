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