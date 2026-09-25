/// @description > cmp_logicalState create event
// > code here
// Inherit the parent event
event_inherited();

// State
init = function() {
	state = new state_machine();
	state.idle = new state.state_create()
		.set_name("state idle")
		.set_step (function() {
			// if move, state free
			if (movement() and on_ground) {
				state.set_state(state.free);
			}
			/// ANIMATION
			animation_state.set_state(animation_state.idle);
		} )
		.set_start(function() {
			// start
			set_sprite(spr_player);
		} )
		.set_stop (function() {
            // stop
		} );
	
	/// STATE FREE
	state.free = new state.state_create()
		.set_name ("state free")
		.set_step (function() {
			// if not moving, state idle
			if (!movement()) {
				state.set_state(state.idle);
			}
			/// ANIMATION
			if (h_speed != 0) {
				movement_direction = sign(h_speed);
				// Delay by 3-7 frames to create smooth transition feels.
				if (movement_direction != facing_direction) {
					call_later(irandom_range(3, 7), time_source_units_frames, function(){
						set_facing_direction(movement_direction);
					})
				}
			}
			if (!cmp_player_input.get_sprint().check){
				// walk
				animation_state.set_state(animation_state.walk);
			} else {
				// run
				handle_dash();
				animation_state.set_state(animation_state.run);
			}
		} )
		.set_start(function() {
			// start
			set_sprite(spr_player);
		} )
		.set_stop (function() {
            // stop
		} );
	
	/// STATE JUMP
	state.mid_air = new state.state_create()
		.set_name ("state mid air")
		.set_step (function() {
			// controls	
			movement();
			if(on_ground){
				state.set_state(state.free);
			}
			/// ANIMATION
			if (h_speed != 0) {
				movement_direction = sign(h_speed);
				// Delay by 3-7 frames to create smooth transition feels.
				if (movement_direction != facing_direction) {
					call_later(irandom_range(3, 7), time_source_units_frames, function(){
						set_facing_direction(movement_direction);
					})
				}
			}
			// will be changed
			if (v_speed < 0) {
				animation_state.set_state(animation_state.jump_up);
			} else {
				animation_state.set_state(animation_state.falling_down);
			}
		} )
		.set_start(function() {
			// start
			set_sprite(spr_player);
		} )
		.set_stop (function() {
			// stop
			jump_count = 0;  // reset jumps
		} );
		
	/// STATE DASH 
	state.dash = new state.state_create()
		.set_name ("state dash")
		.set_step (function() {
			// create trail
			var _inst = cont_game.create_entity(x,y,obj_player_trail);
			_inst.set_sprite(self.sprite_index);
			_inst.image_xscale = self.image_xscale;
			// dash to the direction
			h_speed = (max(__.dash_speed--, 1)) * __.dash_dir;
			// moving vertically ( gravity )
			v_speed = v_speed + (grv/2);
			// move & collide
			var _colliders = movement_collision(h_speed,v_speed,obj_collision);
			if(__.dash_speed < 1) {
				state.set_state(state.free);
				var _ts_reset_dash = time_source_create(time_source_game, .5, time_source_units_seconds, function(){
					__.can_dash = true;
				});
				time_source_start(_ts_reset_dash);
			}
		} )
		.set_start(function() {
			// start
			__.dash_dir = facing_direction;
			__.dash_speed =  __.base_speed * 6;
			__.can_dash = false;
			set_facing_direction(__.dash_dir);
		} )
		.set_stop(function() {
            // stop
		} );
		
	/// STATE DYING
	// create this when ready
	// player will be waiting for revive
	// if no one to revive, enter death screen
	// destroy player and spawn dead player in same place (should be seamless)
	
	// Set initial state
	state.set_state(state.idle);
	
	return state;
}
