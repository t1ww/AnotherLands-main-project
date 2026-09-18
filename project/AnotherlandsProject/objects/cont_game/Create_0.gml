/// @description > cont_game Create event
#region /// Variables //
	// Debugger
	debug = false;
	// Mouse coords
	dbg_mouse_x = mouse_x;
	dbg_mouse_y = mouse_y;
	// Mouse coords to gui
	dbg_mouse_x_gui = mouse_x_gui;
	dbg_mouse_y_gui = mouse_y_gui;
	
	// (Debugger) To toggle showing collision boxes
	dbg_collision_visible = false;
	
	// To set spawnpoint when entering a room
	spawn_id = 0;
	
	self[$ "nearest_interact"] ??= null;
	controller_list = [cont_camera,cont_input,obj_player_controller];
	step_functions = [];
#endregion ///

/// Creation functions
	create_controller = function(_obj) {
		return instance_create_layer(0,0,"controller",_obj);
	}
	create_entity = function(_x, _y, _obj, _config = {}) {
		return instance_create_layer(_x,_y,"entity",_obj, _config);
	}

// Game control scripts
	game_start = function() {
		WORLD.generate(WORLD_SIZE.extra_large);
		room_goto(array_choose(global.biome_starter.another_lands).room_id);
	}
	
/// GAME START UP SCRIPTS ///

#region /// Setup Debug Views//
	function toggle_debug() {
		show_debug_log(!is_debug_overlay_open());
	}	
	/// VALUE DEBUGGER
	value_dbgview		 = dbg_view("Value Debug View", false);
	global_value_section = dbg_section("Global Value Section");
	// //
	this_world_size = get_world_size(WORLD.world_size);
	DBG_OVERLAY.add_variable_labeled(WORLD, "current world index: ", "current_index");
	DBG_OVERLAY.add_variable_labeled(self, "current world size: ", "this_world_size");
	DBG_OVERLAY.add_variable(self.time, "inst_string");
	DBG_OVERLAY.add_variable(self,"mx");
	DBG_OVERLAY.add_variable(self,"my");
	DBG_OVERLAY.add_variable(self,"mx_gui");
	DBG_OVERLAY.add_variable(self,"my_gui");
	DBG_OVERLAY.add_variable(self,"pressed_button_counter");
#endregion ///

// Set title
	window_set_caption(TITLE);
	
// Set draw
	draw_set_default();

// Create all the controllers
	for(var _i = 0; _i < array_length(controller_list); _i++) {
		create_controller(controller_list[_i]);	
	}

// Set collision's visibility
	var _layer = layer_get_id("collision");
	layer_set_visible(_layer,dbg_collision_visible);

// Start game callings
	game_start();
	// set debug overlay to false	
	show_debug_overlay(false);
	// set texture (turn of pixel interpolation)
	gpu_set_tex_filter(false);
	
/// /// TESTING /// /// TESTING /// ///
