/// MISC FUNCTIONS
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
	function draw_set_all(_font = fnt_default, _halign = fa_center, _valign = fa_middle, 
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