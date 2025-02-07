/// Step Event - Zombie Movement

// Get game controller reference
if (instance_exists(obj_game_controller)) {
    var controller = instance_find(obj_game_controller, 0);

    // 🧭 Check if a rally point exists
    if (controller.rally_point_x != -1 && controller.rally_point_y != -1) {
        var distance_to_rally = point_distance(x, y, controller.rally_point_x, controller.rally_point_y);

        // 🏃 Swarm rally point
        if (distance_to_rally > 10) {
            move_towards_point(controller.rally_point_x, controller.rally_point_y, move_speed);
        } else {
            // 🎭 Once at rally point, start wandering again
            if (wander_time <= 0) {
                wander_target_x = x + irandom_range(-100, 100);
                wander_target_y = y + irandom_range(-100, 100);
                wander_time = irandom_range(60, 180);
            } else {
                wander_time--;
                move_towards_point(wander_target_x, wander_target_y, move_speed * 0.5);
            }
        }
    } else {
        // 🛑 No rally point -> Zombies wander randomly
        if (wander_time <= 0) {
            wander_target_x = x + irandom_range(-100, 100);
            wander_target_y = y + irandom_range(-100, 100);
            wander_time = irandom_range(60, 180);
        } else {
            wander_time--;
            move_towards_point(wander_target_x, wander_target_y, move_speed * 0.5);
        }
    }
}

// ⚔️ Zombie Collision Avoidance (Push Each Other)
var near_zombie = instance_nearest(x, y, obj_zombie);
if (near_zombie != noone && near_zombie != id) {
    var dist = point_distance(x, y, near_zombie.x, near_zombie.y);

    if (dist < 20) { // If too close, push away
        var push_angle = point_direction(near_zombie.x, near_zombie.y, x, y);
        x += lengthdir_x(1.0, push_angle);
		y += lengthdir_y(1.0, push_angle);

    }
}
