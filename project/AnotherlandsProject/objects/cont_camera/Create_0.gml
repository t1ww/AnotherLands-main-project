/// @description > cont_camera Create event
// > code here
var _cam = view_get_camera(0);
var _half_cam_x = camera_get_view_width(_cam)*.5;
var _half_cam_y = camera_get_view_height(_cam)*.5;
// Following target
target = { x : _half_cam_x, y : _half_cam_y };
y_buffer = -64; // Set y higher by certain amount

get_origin_x = function() {
	var _cam = view_get_camera(0);
	var _half_cam_x = camera_get_view_width(_cam)*.5;
	return x-_half_cam_x;
}
get_origin_y = function() {
	var _cam = view_get_camera(0);
	var _half_cam_y = camera_get_view_height(_cam)*.5;
	return y-_half_cam_y;	
}