/// Create Event
hp = 50;
move_speed = 1.5;

/// Create Event - Initialize Zombie Behavior
move_speed = 1.5;   // Normal movement speed
wander_time = irandom_range(60, 180); // Random wander duration
wander_target_x = x + irandom_range(-50, 50);
wander_target_y = y + irandom_range(-50, 50);
