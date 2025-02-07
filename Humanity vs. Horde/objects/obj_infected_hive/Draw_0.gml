/// Draw Event

// Draw creep UNDER the hive
draw_set_alpha(0.25); // Transparent effect
draw_set_color(creep_color);
draw_circle(x, y, creep_radius, false);
draw_set_alpha(1); // Reset transparency

// 🛑 If This Object is the Selected One, Draw an Outline
if (obj_game_controller.selected_unit == id) {
    draw_set_color(c_white);
    draw_set_alpha(0.8); // Slight transparency
    draw_rectangle(x - sprite_width / 2 - 2, y - sprite_height / 2 - 2, 
                   x + sprite_width / 2 + 2, y + sprite_height / 2 + 2, false);
    draw_set_alpha(1); // Reset transparency
}

// Draw the hive on top
draw_self();


