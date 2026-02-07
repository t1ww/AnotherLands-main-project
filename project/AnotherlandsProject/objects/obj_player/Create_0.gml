/// @description > player create
// > Imports
    player_scripts = global.player_scripts;
// > code here
	
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
		
    // Inputs
    player_scripts.initialize.inputs();
	
	
#region // DEBUG OVERLAY
	dbg_section("player value section");
	DBG_OVERLAY.add_variable(self.__,"input_h");
	DBG_OVERLAY.add_variable(self.__,"input_v");
#endregion
	
// CREATE CALLBACK
	character_create(50,50);


EVENT_LISTENER.event_assign("pressed_button", self, function(_data) {
    show_debug_message($"Pressed Enter {_data} times")
    if (_data >= 3) {
        character_destroy();
        show_message($"HEY YOU PRESSED ENTER {_data} TIMES")
    }
})