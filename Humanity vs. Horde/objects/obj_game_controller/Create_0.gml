/// Create Event - Force Windowed Fullscreen
var display_width = display_get_width();
var display_height = display_get_height();

// Set application surface size to match display
surface_resize(application_surface, display_width, display_height);

// Enable windowed fullscreen mode
window_set_fullscreen(false);
window_set_size(display_width, display_height);
window_center();

/// Create Event
selected_unit = noone; // Stores reference to the selected unit/building

/// Create Event - Initialize Rally Point
rally_point_x = -1;
rally_point_y = -1;
