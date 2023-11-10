local function toggle_nav_mode(event)
    local player = game.get_player(event.player_index)
    if not player then
        return -- wait, how?
    elseif player.controller_type ~= defines.controllers.character then
        player.play_sound{path = "utility/cannot_build"}
        return
    elseif player.render_mode == defines.render_mode.chart_zoomed_in then
        player.close_map()
    elseif player.render_mode == defines.render_mode.chart then
        player.zoom_to_world(event.cursor_position)
    else
        player.zoom_to_world(player.position)
    end
end

script.on_event("mini-nav-mode", toggle_nav_mode)
