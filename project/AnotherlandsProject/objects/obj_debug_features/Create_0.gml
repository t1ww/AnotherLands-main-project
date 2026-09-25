/// @description > obj_debug_features Create event
// This object is for setting up debug features, debug overlay
// As well as variables used to monitor for debugging
// Mouse coords
dbg_mouse_x = mouse_x;
dbg_mouse_y = mouse_y;
// Mouse coords to gui
dbg_mouse_x_gui = mouse_x_gui;
dbg_mouse_y_gui = mouse_y_gui;

// (Debugger) To toggle showing collision boxes
dbg_collision_visible = false;

// Toggles
debug = false;
toggle_debug = function() {
	// Log
	show_debug_message("Toggling debug");
	
	// Actual toggle
	debug = !debug;
	show_debug_overlay(debug);
	show_debug_log(debug);
}

toggle_collision_visible = function() {
	dbg_collision_visible = !dbg_collision_visible;
	var _layer = layer_get_id("collision");
	layer_set_visible(_layer, dbg_collision_visible);
}

// Main debugger
/// VALUE DEBUGGER
value_dbgview		 = dbg_view("Value Debug View", false);

// World
dbg_section("World");
this_world_size = get_world_size(WORLD.world_size);

dbg_watch(ref_create(self, "this_world_size"), "Current Wolrd Size");
dbg_watch(ref_create(WORLD, "current_index"), "Current world index:");

// Time
dbg_section("Time");

dbg_watch(ref_create(cont_time, "inst_string"), "Time instance");

// Mouse
dbg_section("Mouse coords");

dbg_watch(ref_create(self,"mx"));
dbg_watch(ref_create(self,"my"));
dbg_watch(ref_create(self,"mx_gui"));
dbg_watch(ref_create(self,"my_gui"));

// Player controller
dbg_section("Player Value Section");
dbg_watch(ref_create(obj_player_controller.__,"input_h"));
dbg_watch(ref_create(obj_player_controller.__,"input_v"));

// Player character
dbg_section("Player Character Section");

// Parent
dbg_watch(ref_create(obj_player_character, "parent"));

// State
dbg_watch(ref_create(obj_player_character.state.current_state, "name"));

// Varialbes
dbg_watch(ref_create(obj_player_character, "sprite_index"));
dbg_watch(ref_create(obj_player_character, "x"));
dbg_watch(ref_create(obj_player_character, "y"));
dbg_watch(ref_create(obj_player_character, "h_speed"));
dbg_watch(ref_create(obj_player_character, "v_speed"));
dbg_watch(ref_create(obj_player_character, "on_ground"));
dbg_watch(ref_create(obj_player_character, "jump_count"));
dbg_watch(ref_create(obj_player_character.__, "can_dash"));
dbg_watch(ref_create(obj_player_character.__, "prev_y"));

/// CONTROL DEBUGGER (buttons and other things for testing)
control_dbgview = dbg_view("Dev Controls",DEVELOPMENT);
// SECTION VALUE SLIDERS
dbg_section("Value Sliders");
// //
var _skin_ref = ref_create(CONFIG, "skin");
dbg_color(_skin_ref,"player_skin_color");

var _eyes_ref = ref_create(CONFIG, "eyes");
dbg_color(_eyes_ref,"player_eyes_color");

var _hair_ref = ref_create(CONFIG, "hair_color_picker");
dbg_color(_hair_ref,"player_hair_color");

var _hat_ref = ref_create(CONFIG, "hat_color_picker");
dbg_color(_hat_ref,"player_hat_color");

var _shirt_ref = ref_create(CONFIG, "shirt_color_picker");
dbg_color(_shirt_ref,"player_shirt_color");

var _pants_ref = ref_create(CONFIG, "pants_color_picker");
dbg_color(_pants_ref,"player_pants_color");

// SECTION TELEPORT
dbg_section("Room Goto");
// set room to somewhere
dbg_button("Test room", function() {
	room_goto(rm_test);
});

// SECTION COMMANDS
dbg_section("Command Buttons");
// testing
dbg_button("really cool button", function() {
	show_message("you're cool");
});

// player create
dbg_button("create",function() {
	with(obj_player_controller) character_create(50,50);
});
dbg_same_line();
dbg_text("player character");

// player destroy
dbg_button("destroy",function() {
	with(obj_player_controller) character_destroy();
});
dbg_same_line();
dbg_text("player character");
// world generate
dbg_button("generate", function() {
	WORLD.generate(WORLD_SIZE.extra_large);
});
dbg_same_line();
dbg_text("world");
