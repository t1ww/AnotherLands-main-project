#macro TITLE "Title 2"

// user created scripted
#region /// MACROS
	// null
	#macro null pointer_null
	
	// resolution
	#macro SCREEN_WIDTH 640
	#macro SCREEN_HEIGHT 360

	// directions
	#macro RIGHT 1
	#macro LEFT -1

	// mouse to gui
	#macro mouse_x_gui device_mouse_x_to_gui(0)
	#macro mouse_y_gui device_mouse_y_to_gui(0)

	/// config MARCROS
		#macro START_ROOM rm_start
		#macro ADMIN false
		#macro TESTING false
		#macro DEVELOPMENT false
		
		// dev mode
		#macro Development:START_ROOM rm_start
		#macro Development:TESTING true
		#macro Development:DEVELOPMENT true
		
		// release
		#macro Release:START_ROOM rm_main_menu
		#macro Release:DEVELOPMENT false
		
		// release (skip)
		// { nothing atm }
#endregion

#region /// MISC SCRIPTS
	// // function print(_str = ""){ show_debug_message(_str); } 
	// just type sdm ^
	
	// Room change + others
	function change_room(_rm) {
		// changes room + show debug message
		show_debug_message($"changing room to 'ref: {room_get_name(_rm)}'");
		room_goto(_rm);	
	}
	
	// Random elements in array
	function array_choose(_array) {
		// chooses random element from an array
		if(array_length(_array) != 0){
            var _array_max = max(array_length(_array) - 1, 0);
			return _array[irandom_range(0, _array_max)];
		}
		return _array[0];
	}
	
	// Drawings
	// Resets to middle centre (default)
	function draw_set_default() {
		// set font to default
		draw_set_font(fnt_default);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
	
	// Allows you to swiftly set all of the attributes in one go
	function draw_set_all(_font = fnt_def, _halign = fa_center, _valign = fa_middle, 
							_color = c_white, _alpha = 1){
		// set all font attributes ( skipped gets default )
		draw_set_font(_font);
		draw_set_halign(_halign);
		draw_set_valign(_valign);
		draw_set_color(_color);
		draw_set_alpha(_alpha);	
	}
	
	// Works like lerp but returns value of 0-1
	// - where usual lerp you input 0-1 and it return the value at that point
	function inverse_lerp(_a, _b, _value) {
		return (_value - _a) / (_b - _a);
	}
#endregion