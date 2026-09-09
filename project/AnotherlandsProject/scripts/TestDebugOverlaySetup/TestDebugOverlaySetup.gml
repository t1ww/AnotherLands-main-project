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