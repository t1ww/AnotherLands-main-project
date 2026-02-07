/// @description > cont_game Create event
#region /// Variables //
	debug = false;
	spawn_id = 0;
	mx = mouse_x;
	my = mouse_y;
	mx_gui = mouse_x_gui;
	my_gui = mouse_y_gui;
	collision_visible = false;
	self[$ "nearest_interact"] ??= null;
	controller_list = [cont_camera,cont_input,obj_player];
	// in-game time
	time = {
		tick_rate : 216000,
		tick   :0,	second :0,	
		minute :0,	hour   :0,		
		day	   :0,	month  :0,	year:2024,
		global_tick : 0,
		refresh_global_tick : function() {
			global_tick = tick + (second * 60)   + (minute * 3600)     + (hour * 216000)
					    + (day * 5184000) + (month * 155520000) + (year * 1866240000);
		},
		increment : function() {
			global_tick += tick_rate;
			tick   =  global_tick mod 60;
			second = (global_tick div 60) mod 60;
			minute = (global_tick div 3600) mod 60;
			hour   = (global_tick div 216000) mod 24;
			day	   = (global_tick div 5184000) mod 30;
			month  = (global_tick div 155520000) mod 12;
			year   = (global_tick div 1866240000);
			inst_string = to_string();
		},
		inst_string : "",
		to_string   : function() {
			return $"global_tick : {global_tick},\n"
				 + $"tick        : {tick},\n"
				 + $"second      : {second},\n"
				 + $"minute      : {minute},\n"
				 + $"hour        : {hour},\n"
				 + $"day         : {day   +1},\n"
				 + $"month       : {month +1},\n"
				 + $"year        : {year}\n";
		},
	}
	time.refresh_global_tick();
	ts_time = time_source_create(time_source_game,1,time_source_units_frames, time.increment, [], -1 );
	time_source_start(ts_time);
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
// Set draw
	draw_set_default();

// Create all the controllers
	for (var _i = 0; _i < array_length(controller_list); _i++) {
		create_controller(controller_list[_i]);	
	}

// Hide collision layer
	var _layer = layer_get_id("collision");
	layer_set_visible(_layer,collision_visible);

// Start game callings
	game_start();
	// set debug overlay to false	
	show_debug_overlay(false);
	// set texture (turn of pixel interpolation)
	gpu_set_tex_filter(false);
	
#region /// Debugger //
	function toggle_debug() {
		show_debug_log(!is_debug_overlay_open());
	}	
	/// VALUE DEBUGGER
	global.value_dbgview		= dbg_view("Value Debug View", false);
	global.global_value_section = dbg_section("Global Value Section");
	// //
	DBG_OVERLAY.add_variable_labeled(WORLD, "current world index : ", "current_index");
	DBG_OVERLAY.add_variable(self.time, "inst_string");
	DBG_OVERLAY.add_variable(self,"mx");
	DBG_OVERLAY.add_variable(self,"my");
	DBG_OVERLAY.add_variable(self,"mx_gui");
	DBG_OVERLAY.add_variable(self,"my_gui");
	DBG_OVERLAY.add_variable(self,"pressed_button_counter");
#endregion ///

/// /// TESTING /// /// TESTING /// ///