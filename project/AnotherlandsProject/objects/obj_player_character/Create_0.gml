/// @description > playable character create event
// set player forward
depth -= 1;

/// variable initialization
#region /// public
	// variable
	name = "player";
	// colors
	character_color = {
		skin  : c_white,
		eyes  : c_black,
		hair  : c_white,
		hat   : c_white,
		shirt : c_white,
		pants : c_white,
	}
		
	/// RPG STATS
	// def
	self [$ "health"]  ??= 1;
	self [$ "defense"] ??= 1;
	// dmg
	self [$ "melee_damage"] ??= 1;
	self [$ "range_damage"] ??= 1;
	self [$ "magic_damage"] ??= 1;
	// other
	self [$ "speed"] ??= 1;
	self [$ "luck"]  ??= 1;
	self [$ "reputation"] ??= 1;
	
	// movement stats
	h_accel   = .25; // per frames
	grv		  = .35;
	fall_fric = .05;  // falling slower
	jump_spd  = 5.5;
	
	// dynamic stats
	on_ground = null;
	h_speed = 0;
	v_speed = 0;
	facing_direction = RIGHT; // RIGHT = 1, LEFT = -1;

	// jumps
	normal_jump = function(){
		v_speed = -jump_spd;
	}
	jump_count = 0;
	jump_array = [normal_jump,normal_jump];
#endregion 

#region /// private
	__ = {};
	with __ {
		/// for checking on ground
			prev_y = other.y;
			
		/// player stats
			base_speed  = 3;
			walk_speed  = .5;
			air_control = .05;
		
		/// dashing
			can_dash   = true;
			dash_speed = 12;
		
		// testing
			test1 = 0;
	}	
#endregion 

// eyes blinking
eyes_is_open = true;
eyes_blink_frequency = .7; // second
ts_start_blink = time_source_create(time_source_game, eyes_blink_frequency, time_source_units_seconds, function() {
	eyes_is_open = false;
	time_source_start(ts_stop_blink);
});
ts_stop_blink = time_source_create(time_source_game, (eyes_blink_frequency*.25), time_source_units_seconds, function() {
	eyes_is_open = true;
	time_source_start(ts_start_blink);
});
time_source_start(ts_start_blink);


/// player functions
	// MOVEMENTS
	movement = function() {
		// INPUT CHECK
		var _h_input = parent.get_input_h();
		var _v_input = parent.get_input_v();
		var _sprint_input = parent.get_input_sprint();
		// HORIZONTAL CONTROLS
            if (_h_input != 0) {
                // increasing speed
                if (_sprint_input.check) {
                    // running
                    h_speed = (_h_input) * __.base_speed;
                }else{
                    // walking
                    h_speed = (_h_input) * __.base_speed * __.walk_speed;
                }
            } else { 
				// stopping
				h_speed = 0;
            }
			// RETURNS h_speed
			
		// VERTICAL CONTROLS
			if (_v_input.pressed && jump_count < array_length(jump_array)) {
				jump();
			}
			// gravity
			var _gravity = grv;
			v_speed = v_speed + ((v_speed > 0)? grv - fall_fric : grv );
			
			// RETURNS v_speed
			
		// move and collide
			var _colliders = movement_collision(h_speed,v_speed,obj_collision);
			// set h_speed to 0 when hitting wall
	        if(array_length(_colliders.h_colliders) != 0){
	            h_speed = 0;
	        }
			// set v_speed to 0 when hitting ground
			if(array_length(_colliders.v_colliders) != 0){
	            v_speed = 0;
	        }
			
			// TESTING // ***
			test1 = array_length(_colliders.v_colliders);
			
			on_ground_check();
			if (!on_ground and state != state.mid_air) {
				state.set_state(state.mid_air);	
			}
		var _moving = (h_speed != 0 or !on_ground);
		return _moving;
	}
	// //
	movement_collision = function(_hsp, _vsp, _collsion_object) {
		// apply speed with collision
		// Horizontal move & collide
		var _h_colliders = move_and_collide(_hsp, 0, _collsion_object, abs(_hsp));
             
		// Vertical move & collide
		var _v_colliders = move_and_collide(0, _vsp, _collsion_object, abs(_vsp) , _hsp, _vsp, _hsp, _vsp);
		
		//// moving down slope
		//if (on_ground) && (place_meeting(x,y + abs(_hsp) + 1 ,_collsion_object)) && (_vsp >= 0) {   
		//    _vsp += abs(_hsp) + 1;
		//}
		return { h_colliders : _h_colliders, v_colliders : _v_colliders };
	}
	
	/// OTHERS
	set_sprite = function(_spr) {
		if(sprite_index != _spr) {
			sprite_index = _spr;	
		}
	}
	// //
	animation_wrap = function(_start, _end) {
		if (image_index < _start or image_index > _end) {
			image_index = _start;
		}
	}
	
	on_ground_check = function() {
		if (y != __.prev_y or !place_meeting(x,bbox_bottom,obj_collision)) {
			on_ground = false;
			__.prev_y = y;
		} else {
			on_ground = true;	
		}
	}
	// //
	jump = function() {
		jump_array[jump_count]();
		jump_count++;	
	}
	// //
	jump_ext = function(_hsp,_vsp,_extra_function = function() {}) {
		h_speed += _hsp;
		v_speed =  _vsp;
		_extra_function();
	}
	// //
	set_facing_direction = function(_dir) {
		facing_direction = (_dir == 0)? 1: _dir;
		image_xscale     = facing_direction;	
	}
	
	/// HANDLES
	// dashing
		handle_dash = function() {
			var _dash = parent.get_input_dash();
			if (_dash and __.can_dash) {
				state.set_state(state.dash);
			}	
		}
		
	/// SETTER
	// position
	set_pos = function(_x,_y){
		x = _x;
		y = _y;
		return self;
	}

#region /// /// ANIMATION STATE /// ///
// state
	animation_state = new state_machine();
	with animation_state {
		animation_frame = 0;
		reset_frame = function(){}
		animate = function() {
			animation_wrap(frame_start, frame_stop);
			animation_frame = image_index - frame_start;
		}
		set_sprite = function(_sprite) {
			if sprite_index != _sprite
				sprite_index = _sprite;
				return self;
		}
	}
/// STATE IDLE
	animation_state.idle = new animation_state.state_create()
		.set_name("animation idle")
		.set_step(function() {
			animation_wrap(0, 5);
		});
		animation_state.walk = new animation_state.state_create()
			.set_name("animation walk")
		.set_step(function() {
			animation_wrap(6, 13);
		});
	animation_state.run = new animation_state.state_create()
		.set_name("animation run")
		.set_step(function() {
			animation_wrap(14, 20);
		});
	animation_state.jump_up = new animation_state.state_create()
		.set_name("animation jump_up")
		.set_step(function() {
			animation_wrap(20, 23);
		});
	animation_state.falling_down = new animation_state.state_create()
		.set_name("animation falling_down")
		.set_step(function() {
			animation_wrap(23, 25);
		});

#endregion /// /// ANIMATION STATE /// ///
	
#region ///	/// STATE MACHINE /// ///
// state
	state = new state_machine();
/// STATE IDLE
	state.idle = new state.state_create()
		.set_name("state idle")
		.set_step ( function() {
			// if move, state free
			if (movement() and on_ground) {
				state.set_state(state.free);
			}
			handle_dash();
			/// ANIMATION
			animation_state.set_state(animation_state.idle);
		} )
		.set_start( function() {
			// start
			set_sprite(spr_player);
			// notify
			show_debug_message("entering state idle");
		} )
		.set_stop ( function() {
			show_debug_message("leaving state idle");	
		} );
	
/// STATE FREE
	state.free = new state.state_create()
		.set_name ("state free")
		.set_step ( function() {
			// if not moving, state idle
			if (!movement()) {
				state.set_state(state.idle);
			}
			handle_dash();
			/// ANIMATION
			if (h_speed != 0) {
				set_facing_direction(sign(h_speed));	
			}
			if (!parent.get_input_sprint().check) {
				// walk
				animation_state.set_state(animation_state.walk);
			} else {
				// run
				animation_state.set_state(animation_state.run);
			}
		} )
		.set_start( function() {
			// start
			set_sprite(spr_player);
			// notify
			show_debug_message("entering state free");
		} )
		.set_stop ( function() {
			show_debug_message("leaving state free");	
		} );
	
/// STATE JUMP
	state.mid_air = new state.state_create()
		.set_name ("state mid air")
		.set_step ( function() {
			// controls	
			movement();
			handle_dash();
			if(on_ground){
				state.set_state(state.free);
			}
			/// ANIMATION
			if (h_speed != 0) {
				set_facing_direction(sign(h_speed));	
			}
			// will be changed
			if (v_speed < 0) {
				animation_state.set_state(animation_state.jump_up);
			} else {
				animation_state.set_state(animation_state.falling_down);
			}
		} )
		.set_start( function() {
			// start
			set_sprite(spr_player);
			// notify
			show_debug_message("entering state mid air");
		} )
		.set_stop ( function() {
			// stop
			jump_count = 0;  // reset jumps
			// notify
			show_debug_message("leaving state mid air");
		} );
		
/// STATE DASH 
	state.dash = new state.state_create()
		.set_name ("state dash")
		.set_step ( function() {
			// create trail
			var _inst = cont_game.create_entity(x,y,obj_trail);
			_inst.set_sprite(self.sprite_index);
			_inst.image_xscale = self.image_xscale;
			// dash to the direction
			h_speed = (__.dash_speed--) * __.dash_dir;
			// moving vertically ( gravity )
			v_speed = v_speed + (grv/2);
			// move & collide
			var _colliders = movement_collision(h_speed,v_speed,obj_collision);
			if(__.dash_length-- < 0) {
				state.set_state(state.free);
				var _ts_reset_dash = time_source_create(time_source_game, .5, time_source_units_seconds, function(){
					__.can_dash = true;
				});
				time_source_start(_ts_reset_dash);
			}
		} )
		.set_start( function() {
			// start
			__.dash_dir = sign(mouse_x - x) * 1;
			__.dash_speed = 30;
			__.dash_length = 16; // frames
			__.can_dash = false;
			set_facing_direction(__.dash_dir);
			// notify
			show_debug_message("entering state dash");
		} )
		.set_stop ( function() {
			show_debug_message("leaving state dash");
		} );
		
/// STATE DYING

	// set state
	state.set_state(state.idle);

#endregion ///	/// STATE MACHINE /// ///


/// CREATE CALLING
// body parts initialization
bodyparts_array = [];
draw_separate_self = true;

// constructor
bodypart = function(_sprite, _follow, _offset_x, _offset_y, _target_color, _new_color, _config = function() {}) constructor {
    // variables
    sprite_index = _sprite;
    follow = _follow;
    offset_x = _offset_x;
    offset_y = _offset_y;
    visible = true;
    // color
    target_color = _target_color;
    new_color_part_name = _new_color;

    draw = function() {
        if (visible) {
            var _x, _y;
            _x = follow.x + offset_x;
            _y = follow.y + offset_y;
			
            var _color_array = [
                [c_white, follow.character_color.skin], // Apply color.skin to c_white
                [target_color, variable_instance_get(follow.character_color, new_color_part_name)] // Apply new color to target color
            ];
            shader_set_replace_colors(_color_array);
			
            draw_sprite_ext(sprite_index, follow.image_index, _x, _y, follow.image_xscale, follow.image_yscale, 0, c_white, 1);
            shader_reset(); // Reset the shader after drawing
        }
    }

    array_push(follow.bodyparts_array, self);
}

// create the body parts for drawing
legs		= new bodypart(spr_player_legs,		 self, 0, 0, make_color_rgb(0, 0, 255), "pants");
body		= new bodypart(spr_player_body,		 self, 0, 0, make_color_rgb(255, 0, 0), "shirt");
back_arm	= new bodypart(spr_player_back_arm,  self, 0, 0, make_color_rgb(255, 0, 0), "shirt");
front_arm	= new bodypart(spr_player_front_arm, self, 0, 0, make_color_rgb(255, 0, 0), "shirt");
head		= new bodypart(spr_player_head,		 self, 0, 0, make_color_rgb(255, 0, 0), "hat");
eyes		= new bodypart(spr_player_eyes,		 self, 0, 0, make_color_rgb(20, 0, 0 ), "eyes");
hair		= new bodypart(spr_player_hair,		 self, 0, 0, make_color_rgb(0, 255, 0), "hair");

// drawing
draw_bodyparts = function() {
    array_foreach(bodyparts_array, function(_e, _i) {
        _e.draw();
    });
}


/// CAMERA

// set camera
	if(instance_exists(cont_camera)){
		cont_camera.target = self;	
	}
		
/// /// /// /// /// /// /// ///

#region /// DEBUG OVERLAY //

	// debug overlay setup
	global.playerCharacter_value_section = dbg_section("playerCharacter Value Section");
	DBG_OVERLAY.add_variable(self,"parent");
	
	// seeing state
	var _ref_state = ref_create(self,"state");
	var _ref_current_state = ref_create(_ref_state,"current_state");
	var _ref_state_name = ref_create(_ref_current_state, "name");
	dbg_text($"state : ");
	dbg_same_line();
	dbg_text(_ref_state_name);
	
	// seeing variable
	DBG_OVERLAY.add_variable(self, "sprite_index");
	DBG_OVERLAY.add_variable(self, "x");
	DBG_OVERLAY.add_variable(self, "y");
	
    DBG_OVERLAY.add_variable(self, "h_speed");
    DBG_OVERLAY.add_variable(self, "v_speed");
    DBG_OVERLAY.add_variable(self, "on_ground");
    DBG_OVERLAY.add_variable(self, "jump_count");
	
    DBG_OVERLAY.add_variable(self.__, "can_dash");
	DBG_OVERLAY.add_variable(self.__, "prev_y");
	
	//show_debug_overlay(false);
	
#endregion ///
CONFIG.add_variable(character_color, "skin");
CONFIG.add_variable(character_color, "eyes");
CONFIG.add_variable(character_color, "hair");
CONFIG.add_variable(character_color, "hat");
CONFIG.add_variable(character_color, "shirt");
CONFIG.add_variable(character_color, "pants");
