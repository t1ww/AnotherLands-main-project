/// @description > obj_debug_features Create event
// This object is for setting up debug features, debug overlay
// As well as variables used to monitor for debugging
// > imports
import(cmp_debugPlayer);

// > code here
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
}

toggle_collision_visible = function() {
	dbg_collision_visible = !dbg_collision_visible;
	var _layer = layer_get_id("collision");
	layer_set_visible(_layer, dbg_collision_visible);
}

// Main debugger
/// VALUE DEBUGGER
value_dbgview = dbg_view("Value Debug View", false);

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

/// CONTROL DEBUGGER (buttons and other things for testing)
control_dbgview = dbg_view("Dev Controls", false);

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

cmp_debugPlayer.buttons();

// world generate
dbg_button("generate", function() {
	WORLD.generate(WORLD_SIZE.extra_large);
});
dbg_same_line();
dbg_text("world");

// Keep the log on from the start but hide it
show_debug_log(true);
show_debug_overlay(false);
