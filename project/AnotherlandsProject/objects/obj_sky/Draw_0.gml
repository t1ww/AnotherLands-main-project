/// @description obj_sky : draw event

// Draw the sky, uses shader to change it's color according to time
// follows camera
var _cam_origin_x = cont_camera.get_origin_x();
var _cam_origin_y = cont_camera.get_origin_y();
var _w = SCREEN_WIDTH;
var _h = min(SCREEN_HEIGHT, SCREEN_HEIGHT - (_cam_origin_y + SCREEN_HEIGHT - room_height));
// Draw the sky
draw_sprite_stretched(spr_sky, 0, _cam_origin_x, _cam_origin_y, _w, _h);