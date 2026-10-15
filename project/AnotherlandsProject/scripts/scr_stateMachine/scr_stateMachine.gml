// State machine
function state_machine() constructor {
	current_state = null;
	
	// Constructor
	state_create = function() constructor {
		// init
		name = "null";
		start = function() {/*does nothing*/};
		step  = function() {/*does nothing*/};
		stop  = function() {/*does nothing*/};
		// setter
		function set_name(_name) {
			name = _name;
			return self;
		}
		set_start = function(_script) {
			start = _script;
			return self;
		}
		set_step = function(_script) {
			step = _script;	
			return self;
		}
		set_stop = function(_script) {
			stop = _script;
			return self;
		}
		return self;
	}

	// Setters
	set_state = function(_state) {
		// if state is the same, dont set it
		if (current_state == _state) {
			exit;	
		}
		
		// stop the current state (if any)
		if (current_state != null) {
			current_state.stop();
		}
		
		// set and start new state
		current_state = _state;
		current_state.start();
		
		return current_state;
	}
	
	// Step functions
	step = function() {
		current_state.step();
	}
	
	return self;
}
