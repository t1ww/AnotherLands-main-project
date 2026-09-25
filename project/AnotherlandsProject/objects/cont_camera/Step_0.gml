/// @description > cont_camera Step event
// > code here
// Update look-ahead
if (use_look_ahead && variable_instance_exists(target, "h_speed")) {
	var _target_look_ahead = clamp(
		target.h_speed * look_ahead_speed_scale,
		-look_ahead_distance, look_ahead_distance
	);

	look_ahead_x = lerp(
		look_ahead_x, _target_look_ahead,
		look_ahead_stiffness
	);
} else {
	look_ahead_x = lerp(
		look_ahead_x, 0,
		look_ahead_stiffness
	);
}

// Move camera to target
target_x = target.x + look_ahead_x;
target_y = target.y + y_buffer;

x = lerp(x, target_x, follow_stiffness);
y = lerp(y, target_y, follow_stiffness);

// Snap when close enough
if (abs(x - target_x) < 5) x = target_x;
if (abs(y - target_y) < 5) y = target_y;

// Apply camera position
camera_set_view_pos(
	camera,
	x - half_cam_x,
	y - half_cam_y
);
