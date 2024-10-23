
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
    
    if (not get_buttons(player) and not get_main_frame(player)) then
    
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
        
        while get_buttons(player)~=nil do
            get_buttons(player).destroy()
        end
        
        local flow = mod_gui.get_frame_flow(player)
        if flow.mainframe then
            flow.mainframe.destroy()
        end

        local mod_gui_button_flow = player.gui.top.mod_gui_top_frame
        if (#mod_gui_button_flow["mod_gui_inner_frame"].children == 0) then
            mod_gui_button_flow.mod_gui_inner_frame.destroy()
            mod_gui_button_flow.destroy()
        end

        if settings.get_player_settings(player)["showguiontop"].value then
            create_gui(player)
        end
    end
end

local function modify_speed(player, speed, rgb)
    player.character_running_speed_modifier=settings.get_player_settings(player)[speed].value
    player.create_local_flying_text{
        text = "Running speed set to " .. player.character_running_speed_modifier,
        position = player.position,
        color = rgb,
        time_to_live = 40
    }
end

local function set_runspeed(event, setting)
    local player = game.players[event.player_index]
    if (player.character~=nil) then
        if (setting == "switch") then
            if (player.character_running_speed_modifier == settings.get_player_settings(player)["speed0"].value) then
                -- we are in slow mode
                modify_speed(player, "speed2", {r=0, g=1, b=0})
            else
                -- we are in some faster mode
                modify_speed(player, "speed0", {r=1, g=0, b=0})
            end
        else
            modify_speed(player, setting, {r=1, g=0.5, b=0})
        end
    end
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

local function shortcut_events(event)
    local player = game.players[event.player_index]
    if event.prototype_name=="speed0" or event.prototype_name=="speed1" or event.prototype_name=="speed2" then
        set_runspeed(event, event.prototype_name)
    end
end

script.on_init(initialize)

script.on_event(defines.events.on_player_created, function(event)
    local player = game.players[event.player_index]
    create_gui(player)
end)

script.on_configuration_changed(initialize)

script.on_event("hk-set-speed0", function(event) set_runspeed(event, "speed0") end)
script.on_event("hk-set-speed1", function(event) set_runspeed(event, "speed1") end)
script.on_event("hk-set-speed2", function(event) set_runspeed(event, "speed2") end)
script.on_event("hk-set-speed2", function(event) set_runspeed(event, "speed2") end)
script.on_event("hk-switch-fast-slow", function(event) set_runspeed(event, "switch") end)

script.on_event(defines.events.on_gui_click, function(event) on_gui_click(event) end)
script.on_event(defines.events.on_lua_shortcut, function(event) shortcut_events(event) end)
script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
    if event.setting=="showguiontop" then
        initialize()
    end
end)


