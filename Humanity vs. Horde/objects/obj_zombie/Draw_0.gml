/// Draw Event
draw_self();

// Display HP above the unit
draw_set_color(c_red);
draw_rectangle(x - 10, y - 15, x + (hp / 50) * 20 - 10, y - 10, false);
