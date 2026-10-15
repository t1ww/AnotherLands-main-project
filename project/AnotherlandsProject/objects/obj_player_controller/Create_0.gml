/// @description > obj_player_controller create
// > Imports
import(cmp_player_input);
// > code here
// Initializations
var _self = self;

/// PRIVATE
__ = {};
with __ {
	input_h = 0;
	input_v = 0;
}
// character
__[$ "character"] ??= {};
with(__.character){
	instance = null;
}

/// PUBLIC
character_create = function(_x = 0, _y = 0, _config = {}) {
	if (__.character.instance != null) {
		character_destroy();	
	}
	var _inst = cont_game.create_entity(_x,_y, obj_player_character, _config);
	__.character.instance = _inst;
	_inst.parent = id;
	return _inst;
}

character_destroy = function() {
	if (__.character.instance != null)
	and (instance_exists(__.character.instance))
	{
		instance_destroy(__.character.instance);
		__.character.instance = null;
	}
	return self;
}

// On create
character_create(50,50);
