// Script to initialize player's get input functions
_scr_player_inputs = function(){
	// //
	get_input_h = function() {
		var _key_left  = cont_input.check_hold(vk_left,ord("A"));
		var _key_right = cont_input.check_hold(vk_right,ord("D"));
		return (_key_right - _key_left);
	}
    
	get_input_v = function() {
		var _key = vk_space; // key to check
		var _key_jump		= { 
			pressed : cont_input.check_pressed(_key), 
			check   : cont_input.check_hold(_key)
		};
		return _key_jump;
	}
    
	get_input_sprint = function() {
		var _key = vk_lshift; // key to check
		var _key_sprint		= { 
			pressed : cont_input.check_pressed(_key), 
			check   : cont_input.check_hold(_key), 
			release : cont_input.check_released(_key)
		};
		return _key_sprint;
	}
	
    get_input_dash = function() {
		return cont_input.check_pressed(ord("C"));
	}
    
	get_any_input = function() {
		// input h
		var _check_input_h = get_input_h() != 0;
		// input v
		var _input_v       = get_input_v();
		var _check_input_v = _input_v.pressed or _input_v.check;
		// sprint
		var _input_sprint  = get_input_sprint();
		var _check_input_sprint = _input_sprint.pressed or _input_sprint.check or _input_sprint.released;
		// dash
		var _check_input_dash = get_input_dash();
		
		return _check_input_h or _check_input_v or _check_input_dash or _check_input_sprint;
	}
}