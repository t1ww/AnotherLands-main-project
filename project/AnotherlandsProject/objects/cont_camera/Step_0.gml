/// @description > cont_camera Step event

// Update look-ahead
if (use_look_ahead && variable_instance_exists(target, "h_speed"))
{
	var _target_look_ahead = clamp(
		target.h_speed * look_ahead_speed_scale,
		-look_ahead_distance,
		look_ahead_distance
	);

	look_ahead_x = lerp(
		look_ahead_x,
		_target_look_ahead,
		look_ahead_stiffness
	);
}
else
{
	look_ahead_x = lerp(
		look_ahead_x,
		0,
		look_ahead_stiffness
	);
}

// Move camera to target
x = lerp(
	x,
	target.x + look_ahead_x,
	follow_stiffness
);

y = lerp(
	y,
	target.y + y_buffer,
	follow_stiffness
);

// Apply camera position
camera_set_view_pos(
	camera,
	x - half_cam_x,
	y - half_cam_y
);
