// This script is for : EVENT LISTENER
/*
	event listener idea
		-> assign [event name, object to callback, script to call in the object]
*/

// Initialize event listener system
global.ev_listener = {};
#macro EVENT_LISTENER global.ev_listener

// EVENT LISTENER
with (EVENT_LISTENER) {
    // Map list for listeners
    list = ds_map_create();
  
    // Event fire function
    event_fire = function(_event_name, _data) {
        var _listeners_array = ds_map_find_value(EVENT_LISTENER.list, _event_name);
        if (_listeners_array != undefined) {
            for (var i = 0; i < array_length(_listeners_array); i++) {
				try {
	                var _listener = _listeners_array[i];
	                with (_listener.object) {
	                    script_execute(_listener.script, _data);
	                }
				} catch(_e){
					show_debug_message(
						"Listener of the fired event doesn't exist, it may have been removed or destroyed"
					);
				}
            }
        }
		return self;
    }

    // Event assign function
    event_assign = function(_event_name, _object, _script) {
        var _new_listener = {object: _object, script: _script};

        var _listeners_array;
        if (ds_map_exists(EVENT_LISTENER.list, _event_name)) {
            _listeners_array = ds_map_find_value(EVENT_LISTENER.list, _event_name);
        } else {
            _listeners_array = [];
            ds_map_add(EVENT_LISTENER.list, _event_name, _listeners_array);
        }
        array_push(_listeners_array, _new_listener);
		
		return self;
    }

    // Event unassign function
    event_unassign = function(_event_name, _object, _script) {
		// Check if event name exist
        if (ds_map_exists(EVENT_LISTENER.list, _event_name)) {
            var _listeners_array = ds_map_find_value(EVENT_LISTENER.list, _event_name);
            for (var i = array_length(_listeners_array) - 1; i >= 0; i--) {
                var _listener = _listeners_array[i];
                if (_listener.object == _object && _listener.script == _script) {
                    array_delete(_listeners_array, i, 1);
                }
            }
        }
		return self;
    }

    // Event overwrite function
    event_overwrite = function(_event_name, _object, _script, _new_script) {
		event_unassign(_event_name, _object, _script);
		event_assign(_event_name, _object, _new_script);
		
		return self;
    }
	
}