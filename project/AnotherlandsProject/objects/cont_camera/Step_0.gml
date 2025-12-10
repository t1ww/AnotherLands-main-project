/// @description > cont_camera Step event
// > code here

// Move camera to target
var _stiffness = .3; // ( 0 - 1 )
x = lerp(x, target.x, _stiffness);
y = lerp(y, target.y + y_buffer, _stiffness);

// Set camera
var _cam = view_get_camera(0);
var _x = x - camera_get_view_width(_cam)*.5;
var _y = y - camera_get_view_height(_cam)*.5;
camera_set_view_pos(_cam,_x,_y);
view_set_camera(0,_cam);