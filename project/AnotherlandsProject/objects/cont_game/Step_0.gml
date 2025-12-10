/// @description > cont_game Step event

// Variable for debug ref
	// Mouse coords
	mx = mouse_x;
	my = mouse_y;
	// Mouse to gui
	mx_gui = mouse_x_gui;
	my_gui = mouse_y_gui;
	
#region /// interactables
/*
	If mouse is far from the character, get the nearest interactables to the character
	Else get the nearest interactables to the mouse
*/
	if (!instance_exists(obj_player) 
	or obj_player.__.character.instance == null) { exit; }
	// // 
	var _inst = null, _p = obj_player.__.character.instance;
	// If mouse is near the player (128px)
	if(point_distance(mouse_x,mouse_y,_p.x,_p.y) < 256) {
		// Get nearest to mouse
		_inst = instance_nearest(mouse_x,mouse_y,p_interactable);
		if (instance_exists(_inst)){
			// If its too far from player, set to null
			if (point_distance(_p.x,_p.y,_inst.x,_inst.y) > 64){
				_inst = null;	
			}
		}
	
	// If distance mouse_x, _p.x >= 256
	} else {
		// Get nearest to player
		_inst = instance_nearest(_p.x,_p.y,p_interactable);
		if (instance_exists(_inst)){
			// If its too far from player, set to null
			if (point_distance(_p.x,_p.y,_inst.x,_inst.y) > 64){
				_inst = null;	
			}
		}
	}
	
	// If _inst is different from nearest_interact, update it
	if(_inst != nearest_interact) {nearest_interact = _inst;}
#endregion

array_foreach(step_functions, function(e,i) {
	e();	
});

#region /// /// TESTING /// /// TESTING /// ///
	if (cont_input.check_all(vk_shift, vk_enter, ord("L"))) {
		obj_player.character_destroy();
	}
	
    pressed_button_counter = function() {
		static enter_pressed_counter = 0;
		return ++enter_pressed_counter;
	}
	if (cont_input.check_pressed(vk_enter)) {
		EVENT_LISTENER.event_fire("pressed_button", pressed_button_counter());
	}
#endregion