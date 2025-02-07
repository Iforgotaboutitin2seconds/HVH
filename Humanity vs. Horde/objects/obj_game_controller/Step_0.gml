/// Step Event - Handle Selection
if (mouse_check_button_pressed(mb_left)) {
    var clicked_unit = instance_position(mouse_x, mouse_y, obj_infected_hive); // Extend for other unit types later

    if (clicked_unit != noone) {
        selected_unit = clicked_unit;
    } else {
        selected_unit = noone;
    }
}


/// Step Event - Handle UI Button Clicks
if (selected_unit != noone) {
    var screen_width = display_get_gui_width();
    var screen_height = display_get_gui_height();
    var ui_height = max(80, screen_height * 0.15);

    var action_x = screen_width * 0.75;
    var action_y = screen_height - ui_height + 10;
    var action_width = screen_width * 0.22;
    var action_height = ui_height - 20;

    // Check if Player Clicks the Button
    if (mouse_check_button_pressed(mb_left)) {
        if (mouse_x >= action_x && mouse_x <= action_x + action_width &&
            mouse_y >= action_y && mouse_y <= action_y + action_height) {
            selected_unit.create_zombie();
        }
    }

    // Press "Z" to Create a Zombie
    if (keyboard_check_pressed(ord("Z"))) {
        selected_unit.create_zombie();
    }
}

/// Step Event - Set Rally Point for Normal Zombies
if (mouse_check_button_pressed(mb_right)) {
    if (selected_unit != noone && selected_unit.object_index == obj_infected_hive) {
        rally_point_x = mouse_x;
        rally_point_y = mouse_y;
        show_debug_message("Rally point set at: " + string(rally_point_x) + ", " + string(rally_point_y));
    }
}
