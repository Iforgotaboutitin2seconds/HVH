/// Draw GUI Event - RTS UI Layout
if (selected_unit != noone) {
    var screen_width = display_get_gui_width();
    var screen_height = display_get_gui_height();
    var ui_height = max(80, screen_height * 0.15); // Scales UI height dynamically

    // 🟥 BOTTOM UI BACKGROUND (Full width)
    draw_set_color(c_blue);
    draw_rectangle(0, screen_height - ui_height, screen_width, screen_height, false);

    // 🟪 SECTION 1: Bottom Left (Mini-map Placeholder)
    var mini_x = 20;
    var mini_y = screen_height - ui_height + 10;
    var mini_width = screen_width * 0.2; // 20% of the screen width
    var mini_height = ui_height - 20;

    draw_set_color(c_black);
    draw_rectangle(mini_x, mini_y, mini_x + mini_width, mini_y + mini_height, false);
    draw_set_color(c_white);
    draw_text(mini_x + 10, mini_y + 10, "Mini-map");

    // 🟩 SECTION 2: Middle Bottom (Basic Info: Name, HP)
    var info_x = screen_width * 0.3; // Starts at 30% of screen width
    var info_y = screen_height - ui_height + 20;
    var info_width = screen_width * 0.4; // 40% width
    var info_height = ui_height - 40;

    draw_set_color(c_black);
    draw_rectangle(info_x, info_y, info_x + info_width, info_y + info_height, false);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(info_x + info_width / 2, info_y + 10, selected_unit.name);
    draw_text(info_x + info_width / 2, info_y + 30, "HP: " + string(selected_unit.hp) + "/" + string(selected_unit.max_hp));

    // 🟦 SECTION 3: Bottom Right (Actions UI)
    var action_x = screen_width * 0.75;
    var action_y = screen_height - ui_height + 10;
    var action_width = screen_width * 0.22;
    var action_height = ui_height - 20;

    draw_set_color(c_black);
    draw_rectangle(action_x, action_y, action_x + action_width, action_y + action_height, false);

    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    draw_text(action_x + action_width / 2, action_y + 10, "[Z] Create Zombie");
}

/// Draw GUI Event - Display Rally Point
if (rally_point_x != -1 && rally_point_y != -1) {
    draw_set_color(c_red);
    draw_circle(rally_point_x, rally_point_y, 10, false);
}
