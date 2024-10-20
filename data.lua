
local default_gui = data.raw['gui-style'].default

default_gui["button_default"] = {
    type = "button_style",
    align = "center",
    vertical_align = "center",
    font="default-small",
    top_padding = 0,
    bottom_padding = 0,
    left_padding = 0,
    right_padding = 0,
    height = 20,
    width = 30
}

data:extend({
    {
        type = "custom-input",
        name = "hk-set-speed0",
        key_sequence = "ALT + 1",
        order = 'a-a',
    },
    {
        type = "custom-input",
        name = "hk-set-speed1",
        key_sequence = "ALT + 2",
        order = 'a-b',
    },
    {
        type = "custom-input",
        name = "hk-set-speed2",
        key_sequence = "ALT + 3",
        order = 'a-c',
    },
    {
        type = "shortcut",
        name = "speed0",
        order = "r[running]-s[speed0]",
        action = "lua",
        associated_control_input = "hk-set-speed0",
        localised_name = {"shortcuts.shortcut-speed0"},
        toggleable = false,
        icon = "__RunningSpeed__/graphics/button1c.png",
        icon_size = 128,
        disabled_icon = "__RunningSpeed__/graphics/button1c.png",
        disabled_icon_size = 128,
        small_icon = "__RunningSpeed__/graphics/button1.png",
        small_icon_size = 64,
        disabled_small_icon = "__RunningSpeed__/graphics/button1.png",
        disabled_small_icon_size = 64
    },
    {
        type = "shortcut",
        name = "speed1",
        order = "r[running]-s[speed1]",
        action = "lua",
        associated_control_input = "hk-set-speed1",
        localised_name = {"shortcuts.shortcut-speed1"},
        toggleable = false,
        icon = "__RunningSpeed__/graphics/button2c.png",
        icon_size = 128,
        disabled_icon = "__RunningSpeed__/graphics/button2c.png",
        disabled_icon_size = 128,
        small_icon = "__RunningSpeed__/graphics/button2.png",
        small_icon_size = 64,
        disabled_small_icon = "__RunningSpeed__/graphics/button2.png",
        disabled_small_icon_size = 64
    },
    {
        type = "shortcut",
        name = "speed2",
        order = "r[running]-s[speed2]",
        action = "lua",
        associated_control_input = "hk-set-speed2",
        localised_name = {"shortcuts.shortcut-speed2"},
        toggleable = false,
        icon = "__RunningSpeed__/graphics/button3c.png",
        icon_size = 128,
        disabled_icon = "__RunningSpeed__/graphics/button3c.png",
        disabled_icon_size = 128,
        small_icon = "__RunningSpeed__/graphics/button3.png",
        small_icon_size = 64,
        disabled_small_icon = "__RunningSpeed__/graphics/button3.png",
        disabled_small_icon_size = 64
    },

})
