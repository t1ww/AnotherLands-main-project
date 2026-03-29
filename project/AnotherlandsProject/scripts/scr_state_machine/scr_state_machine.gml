// This script is for :
/*
	state machine, constructor for it and it's functions
*/

// *** READ ***
/*
	example use
	
	(optional : i use func as function())
	#macro func function()
	
	// state
		state = new state_machine();
		animation = new state_machine();
		
	/// STATE IDLE
		state.idle = new state.state_create()
			.set_name("state idle")
			.set_step ( func {
				// if move, state free
				if (movement() and on_ground) {
					state.set_state(state.free);
				}
				/// ANIMATION
				animation_state.set_state(animation_state.idle);
			} )
			.set_start( func {
				// start
				set_sprite(spr_player);
				// notify
				show_debug_message("entering state idle");
			} )
			.set_stop ( func {
				show_debug_message("leaving state idle");	
			} );
	/// STATE free
		state.free = new state.state_create()
			.set_name("state free")
			.set_step ( func {
				// if not moving, state idle
				if (!movement() and on_ground) {
					state.set_state(state.idle);
				}
				/// ANIMATION
				animation.set_state(animation.free);
			} )
			.set_start( func {
				// start
				set_sprite(spr_player);
				// notify
				show_debug_message("entering state free");
			} )
			.set_stop ( func {
				show_debug_message("leaving state free");	
			} );
			
	/// animation state
	animation.idle = new animation.state_create()
		.set_name("animation idle")
		.set_step(func {
			animation_wrap(0, 5);
		});
	animation.idle = new animation.state_create()
		.set_name("animation idle")
		.set_step(func {
			animation_wrap(6, 10);
		});
	
	/// DONT FORGET to call step function in step event
	
	// object step event :
	state.step();
	animation.step();
*/

//

function state_machine() constructor {
	current_state = null;
	parent = other.id;
	show_debug_message(parent.name + " is the parent of this state");
	
	step = function () {
		current_state.step();
	}
	
	set_state = function(_state) {
		// if state is the same, dont set it
		if (current_state == _state){
			exit;	
		}
		
		// stop the current state (if any)
		if (current_state != null) {
			current_state.stop();
		}
		show_debug_message("------------------");
		// set and start new state
		current_state = _state;
		current_state.start();
		
		return _state;
	}

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
		set_start = function(_script){
			start = _script;
			return self;
		}
		set_step = function(_script){
			step = _script;	
			return self;
		}
		set_stop = function(_script){
			stop = _script;
			return self;
		}
		return self;
	}

	return self;

}
