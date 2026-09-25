/// @description > cont_game Create event
// > code here
/// Variables ///
// Spawnpoint when entering a room
spawn_id = 0;

// Controllers that exist for the entire application/session
persistent_controller_list = [
	cont_camera,
	cont_input,
	cont_time,
	obj_debugFeatures
];

// Controllers that only exist while actually playing
ingame_controller_list = [
	cont_interactings,
	obj_player_controller
];

/// Creation functions
create_controller = function(_obj) {
	return instance_create_layer(0,0,"controller",_obj);
}
create_entity = function(_x, _y, _obj, _config = {}) {
	return instance_create_layer(_x,_y,"entity",_obj, _config);
}

/// Helper functions
create_persistent_controllers = function() {
	for(var _i = 0; _i < array_length(persistent_controller_list); _i++) {
		create_controller(persistent_controller_list[_i]);	
	}	
}

create_ingame_controllers = function() {
	for(var _i = 0; _i < array_length(ingame_controller_list); _i++) {
		create_controller(ingame_controller_list[_i]);	
	}
}

destroy_ingame_controllers = function() {
	instance_destroy_from_array(ingame_controller_list);
}

// Game control functions
game_start = function() {
	// Create in-game controllers
	create_ingame_controllers();

	// Generate world
	WORLD.generate(WORLD_SIZE.extra_large);
	
	// Room-go-to start room
	room_goto(array_choose(global.biome_starter.another_lands).room_id);
}
	
/// GAME START UP CODES ///
// Set title
window_set_caption(TITLE);
	
// Set draw
draw_set_default();

// Create persistent controllers
create_persistent_controllers();

// Set debug overlay to false	
show_debug_overlay(false);

// Set texture (turn of pixel interpolation)
gpu_set_tex_filter(false);

// Start game
game_start();
