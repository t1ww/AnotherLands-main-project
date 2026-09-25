/// @description > objectname eventname event
// > code here

// Inherit the parent event
event_inherited();

watches = function() {
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
}

parts_color_picker = function() {
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
}

buttons = function() {
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
}
