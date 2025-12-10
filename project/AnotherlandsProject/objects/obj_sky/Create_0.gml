/// @description obj_sky : create event
// Created in "scene" layer every room enter
// Handles everything happening in sky
// clouds, sun, sky color, sky critters
// Make sure its far back from the scene
depth += 1;

// Draw black box underground
underground_black_box = instance_create_layer(x,y, "props", obj_generic);
with(underground_black_box) {
	depth -= 1;
	set_draw(function() {
		var _cam_origin_x = cont_camera.get_origin_x();
		var _cam_origin_y = cont_camera.get_origin_y();
		var _w = SCREEN_WIDTH;
		var _h = min(SCREEN_HEIGHT, SCREEN_HEIGHT - (_cam_origin_y + SCREEN_HEIGHT - room_height));
		if (SCREEN_HEIGHT > _h) {
			var _c = c_black;
			draw_rectangle_color (
				_cam_origin_x, 
				_cam_origin_y + _h, 
				_cam_origin_x + _w,
				_cam_origin_y + SCREEN_HEIGHT, 
				_c,_c,_c,_c, 
				false
			);
		}
	});
}

// Timer and random chance of critter spawn