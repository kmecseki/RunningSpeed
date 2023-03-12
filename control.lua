
local mod_gui = require("mod-gui")

function get_buttons(player)
    local flow = mod_gui.get_button_flow(player)
    if flow.button_speed0 then
        return flow.button_speed0
    elseif flow.button_speed1 then
        return flow.button_speed1
    elseif flow.button_speed2 then
        return flow.button_speed2
    else
        return nil
    end
end

function get_main_frame(player)
    local flow = player.gui.screen
    if flow.mainframe then
        return flow.mainframe
    else
        return nil
    end
end

function create_gui(player)
    if (not get_buttons(player)
        and not get_main_frame(player)) then
        mod_gui.get_button_flow(player).add({
            type = "button",
            style = "button_default",
            name = "button_speed0",
            caption = ">",
            tooltip = "Hotkey: Alt + 1"
        })
        mod_gui.get_button_flow(player).add({
            type = "button",
            style = "button_default",
            name = "button_speed1",
            caption = ">>",
            tooltip = "Hotkey: Alt + 2"
        })
        mod_gui.get_button_flow(player).add({
            type = "button",
            style = "button_default",
            name = "button_speed2",
            caption = ">>>",
            tooltip = "Hotkey: Alt + 3"
        })
    end
end

local function initialize()
    for _, player in pairs(game.players) do
        create_gui(player)
    end
    for _, player in pairs(game.players) do
        local flow = mod_gui.get_frame_flow(player)
        if flow.mainframe then
            flow.mainframe.destroy()
        end
    end
end

script.on_init(initialize)

script.on_event(defines.events.on_player_created, function(event)
    local player = game.players[event.player_index]
    create_gui(player)
end)

script.on_configuration_changed(initialize)

function set_runspeed(event, setting)
    local player = game.players[event.player_index]
    player.character_running_speed_modifier=settings.get_player_settings(player)[setting].value
    player.create_local_flying_text{
        text = "Running speed set to " .. player.character_running_speed_modifier,
        position = player.position,
        color = {r=1, g=0.5, b=0},
        time_to_live = 40
        }
end

function on_gui_click(event)
    local element = event.element

    if (element.name == "button_speed0") then
        set_runspeed(event, "speed0")

    elseif (element.name == "button_speed1") then
        set_runspeed(event, "speed1")

    elseif (element.name == "button_speed2") then
        set_runspeed(event, "speed2")

    end
end

script.on_event("hk-set-speed0", function(event) set_runspeed(event, "speed0") end)
script.on_event("hk-set-speed1", function(event) set_runspeed(event, "speed1") end)
script.on_event("hk-set-speed2", function(event) set_runspeed(event, "speed2") end)

script.on_event(defines.events.on_gui_click, function(event)
    on_gui_click(event)
end)



