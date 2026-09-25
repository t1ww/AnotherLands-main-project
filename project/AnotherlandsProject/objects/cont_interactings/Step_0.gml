/// @description > cont_interactings step event
// > code here
/*
	If mouse is far from the character, get the nearest interactables to the character
	Else get the nearest interactables to the mouse
*/
if (!instance_exists(obj_player_character)) {
    exit;
}
var _inst = null, _p = obj_player_controller.__.character.instance;

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
