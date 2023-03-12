
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


})
