/// @description > cont_camera Create event
// > code here
// Camera
camera = view_get_camera(0);

half_cam_x = camera_get_view_width(camera) * 0.5;
half_cam_y = camera_get_view_height(camera) * 0.5;

// Target
target = {
	x: half_cam_x,
	y: half_cam_y
};

// Camera Configs
follow_stiffness = 0.7; // 1 = Immediately snap
y_buffer = -64; // Go up by 64px

// Look Ahead
use_look_ahead = false;

// Dynamic variable
look_ahead_x = 0;

// Configs
look_ahead_distance = 96;
look_ahead_speed_scale = 12;
look_ahead_stiffness = 0.02; // 1 = Immediately snap to look ahead

// Functions
// Setters
set_target = function(_target) {
	target = _target;
	return self;
};

set_look_ahead = function(_use_look_ahead) {
	use_look_ahead = _use_look_ahead;
	return self;
}

// Getters
get_origin_x = function() {
	half_cam_x = camera_get_view_width(camera) * 0.5;
	return x - half_cam_x;
};

get_origin_y = function() {
	half_cam_y = camera_get_view_height(camera) * 0.5;
	return y - half_cam_y;
};
