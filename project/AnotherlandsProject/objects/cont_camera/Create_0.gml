/// @description > cont_camera Create event

// Initializations
camera = view_get_camera(0);

half_cam_x = camera_get_view_width(camera) * 0.5;
half_cam_y = camera_get_view_height(camera) * 0.5;

target = {
	x : half_cam_x,
	y : half_cam_y
};

// Config
y_buffer = -64; // Offset camera upward

// Functions
get_origin_x = function() {
    half_cam_x = camera_get_view_width(camera) * 0.5;
	return x - half_cam_x;
};

get_origin_y = function() {
    half_cam_y = camera_get_view_height(camera) * 0.5;
	return y - half_cam_y;
};
