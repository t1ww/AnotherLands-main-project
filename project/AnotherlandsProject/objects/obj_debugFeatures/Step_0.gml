/// @description > obj_debug_features Step event
// Update mouse coords
// Mouse coords
dbg_mouse_x = mouse_x;
dbg_mouse_y = mouse_y;
// Mouse coords to gui
dbg_mouse_x_gui = mouse_x_gui;
dbg_mouse_y_gui = mouse_y_gui;

// Keys-combo features
// Quick game end
if (keyboard_check(vk_lshift)) {
	if (keyboard_check(vk_escape)) {
		game_end();	
	}
}

// Quick restart
if (keyboard_check(vk_lshift)) {
	if (keyboard_check(ord("R"))) {
		game_restart();
	}
}

// Toggle debug
if (keyboard_check_pressed(vk_f3)) {
	toggle_debug();	
}