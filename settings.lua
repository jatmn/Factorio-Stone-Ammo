data:extend({
    {
        type = "string-setting",
        name = "j_sa_kb_behaviour",
        setting_type = "startup",
        order = "a1",
		default_value = "Knockback",
		allowed_values =  {"Knockback", "No Knockback"},
    },
    {
        type = "int-setting",
        name = "j_sa_damage",
        setting_type = "startup",
        order = "a2",
		default_value = 1,
        minimum_value = 1
    },
    {
        type = "int-setting",
        name = "j_sa_stone",
        setting_type = "startup",
        order = "a3",
		default_value = 5,
        minimum_value = 1
    },
    {
        type = "int-setting",
        name = "j_sa_size",
        setting_type = "startup",
        order = "a4",
		default_value = 10,
        minimum_value = 1
    },
    {
        type = "int-setting",
        name = "j_sa_clips",
        setting_type = "startup",
        order = "a5",
		default_value = 10,
        minimum_value = 1
    },


})