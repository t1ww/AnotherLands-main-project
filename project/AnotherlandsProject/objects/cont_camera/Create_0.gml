/// @description > cont_camera Create event

// Camera
camera = view_get_camera(0);

half_cam_x = camera_get_view_width(camera) * 0.5;
half_cam_y = camera_get_view_height(camera) * 0.5;

// Target
target = {
	x : half_cam_x,
	y : half_cam_y
};

// Camera Configs
follow_stiffness = 0.3;
y_buffer = -64;

// Look Ahead
use_look_ahead = false;

// Dynamic variable
look_ahead_x = 0;

// Configs
look_ahead_distance = 96;
look_ahead_speed_scale = 12;
look_ahead_stiffness = 0.1;

// Functions
set_target = function(_target, _use_look_ahead = false) {
	target = _target;
	use_look_ahead = _use_look_ahead;
};

get_origin_x = function() {
	half_cam_x = camera_get_view_width(camera) * 0.5;
	return x - half_cam_x;
};

get_origin_y = function() {
	half_cam_y = camera_get_view_height(camera) * 0.5;
	return y - half_cam_y;
};
