/// Step Event - Selection & Zombie Creation
// Left-click to select the Hive
if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        selected = true;
    } else {
        selected = false;
    }
}

/// Function to Create a Zombie
function create_zombie() {
    var spawn_x = x + irandom_range(-30, 30);
    var spawn_y = y + irandom_range(-30, 30);
    instance_create_layer(spawn_x, spawn_y, "Instances", obj_zombie);
}
