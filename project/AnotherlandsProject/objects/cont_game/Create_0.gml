/// @description > cont_game Create event
// > code here
/// Variables ///
// Spawnpoint when entering a room
spawn_id = 0;

// Interactables
self[$ "nearest_interact"] ??= null;

// List Controllers
controller_list = [
	// Main controllers
	cont_camera,
	cont_input,
	cont_time,
	
	// Player controller
	obj_player_controller,
	
	// Dbg overlay
	obj_debug_features
];

/// Creation functions
create_controller = function(_obj) {
	return instance_create_layer(0,0,"controller",_obj);
}
create_entity = function(_x, _y, _obj, _config = {}) {
	return instance_create_layer(_x,_y,"entity",_obj, _config);
}

// Game control functions
game_start = function() {
	WORLD.generate(WORLD_SIZE.extra_large);
	room_goto(array_choose(global.biome_starter.another_lands).room_id);
}
	
/// GAME START UP CODES ///
// Set title
window_set_caption(TITLE);
	
// Set draw
draw_set_default();

// Create all controllers
for(var _i = 0; _i < array_length(controller_list); _i++) {
	create_controller(controller_list[_i]);	
}

// Set debug overlay to false	
show_debug_overlay(false);

// Set texture (turn of pixel interpolation)
gpu_set_tex_filter(false);

// Start game
game_start();
