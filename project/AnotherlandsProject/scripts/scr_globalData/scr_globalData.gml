// INITIALIZATION
// global data
global.Data = {};
#macro DATA global.Data
// save data
global.Save_Data = {};
#macro SAVE_DATA global.Save_Data

#region // GAME DATA SETUPS //
	///	//					//	
	/// strings for language management
	DATA [$ "Language"] = {};
	with (DATA.Language) {
		english = {
			main_menu : {
				__new_game__ : "New game",
				__setting__  : "Setting" ,
				__exit__	 : "Exit"		
			}
		}
		thai = {
			main_menu : {
				__new_game__ : "เริ่มเกมใหม่",
				__setting__  : "ตั้งค่า" ,
				__exit__	 : "ออกเกม"		
			}
		}
	}
	
	/// ENEMY TYPES
	enum ENTITY_MOVEMENT_TYPE {
		landed,
		flying,
		swimming,
	}
#endregion

#region // SAVE DATA
	/// id for player client (will use their account id)
	SAVE_DATA [$ "client_id"] = 0;
	
	/// world saves
	SAVE_DATA [$ "character_save_slot"] = 0;
	SAVE_DATA [$ "world_save_slot"]		= 0;
	SAVE_DATA [$ "seed"] = 0; // seed for world generation
	SAVE_DATA [$ "latest_saved_room"] = START_ROOM;
	
	/// statistics
	SAVE_DATA [$ "statistics"] = [
		{ name : "kill_count"		, amount : 0 },
		{ name : "rooms_travelled"	, amount : 0 },
		{ name : "npc_greeted"		, amount : 0 },
	];
#endregion

/// / /// / ///

// CONFIG FOR TESTING
global.config_variables = {};
#macro CONFIG global.config_variables
with (CONFIG) {
	// variables adding
	variables_list = [];
	add_variable = function(_variable_name, _inst){
		CONFIG[$ _variable_name] ??= null;
		array_push(variables_list, {variable_name : _variable_name, binding_inst : _inst});
		// create ref to put in debug overlay
		var _ref_global = ref_create(global, "config_variables");
	    var _ref = ref_create(_ref_global,string(_variable_name));
	    dbg_text($"{_variable_name} : ");
	    dbg_same_line();
	    dbg_text(_ref);
	}
	add_variable_labeled = function(_label,_variable_name, _inst){

		// i could use with inst here??

		CONFIG[$ _variable_name] ??= null;
		array_push(variables_list, {variable_name : _variable_name, binding_inst : _inst});
		// create ref to put in debug overlay
	    var _ref = ref_create(_inst,_variable_name);
	    dbg_text($"{_label} : ");
	    dbg_same_line();
	    dbg_text(_ref);
	}
	add_color_picker = function () {}
	refresh = function () {
		// delete entire section
		
		// re create section
	}
	update_variables = function() {
		array_foreach(variables_list, function(e,i) {
			e.binding_inst[$ variable_name] = CONFIG[$ variable_name];
		});
	}
		
	// save
		save = function() {
			// save variables here
			var _save = variables_list;
		}
	// load
		load = function() {}
		
	load();
}
#region //// debug overlay setup
/// CONTROL DEBUGGER (buttons and other things for testing)
	global.control_dbgview = dbg_view("Dev Controls",DEVELOPMENT);
	
// SECTION VALUE SLIDERS

// use a different view

	dbg_section("Value Sliders");
	// //
	var _skin_ref = ref_create(CONFIG,"skin");
	dbg_color(_skin_ref,"player_skin_color");
	
	var _eyes_ref = ref_create(CONFIG,"eyes");
	dbg_color(_eyes_ref,"player_eyes_color");
	
	var _hair_ref = ref_create(CONFIG,"hair_color_picker");
	dbg_color(_hair_ref,"player_hair_color");
	
	var _hat_ref = ref_create(CONFIG,"hat_color_picker");
	dbg_color(_hat_ref,"player_hat_color");
	
	var _shirt_ref = ref_create(CONFIG,"shirt_color_picker");
	dbg_color(_shirt_ref,"player_shirt_color");
	
	var _pants_ref = ref_create(CONFIG,"pants_color_picker");
	dbg_color(_pants_ref,"player_pants_color");
	
// SECTION TELEPORT
	dbg_section("Room Goto");
	// set room to somewhere
	
// SECTION COMMANDS
	dbg_section("Command Buttons");
	// testing
	dbg_button("really cool button", function() {
		show_message("you're cool");
	});
	// player create
	dbg_button("create",function() {
		with(obj_player) character_create(50,50);
	});
	dbg_same_line();
	dbg_text("player character");
	// player destroy
	dbg_button("destroy",function() {
		with(obj_player) character_destroy();
	});
	dbg_same_line();
	dbg_text("player character");
	// world generate
	dbg_button("generate", function() {
		WORLD.generate(WORLD_SIZE.extra_large);
	});
	dbg_same_line();
	dbg_text("world");
#endregion 