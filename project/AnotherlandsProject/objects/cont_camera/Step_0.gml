/// @description > cont_camera Step event

// Move camera to target
var stiffness = 0.3; // (0-1)
x = lerp(x, target.x, stiffness);
y = lerp(y, target.y + y_buffer, stiffness);

// Apply camera position
camera_set_view_pos(
	camera,
	x - half_cam_x,
	y - half_cam_y
);
