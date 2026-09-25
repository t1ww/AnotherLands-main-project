/// @description > playable character create event
// > Imports
    // Components
	import(cmp_player_input);
    import(cmp_eyes_blinking);
	import(cmp_animationState);
	import(cmp_logicalState);
	
	// Debug
	import(cmp_debugPlayer);
// > code here
// Set player 1 unit closer to the screen
depth -= 1;

/// Variable initialization
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

/// player functions
// MOVEMENTS
movement = function() {
		// INPUT CHECK
		var _h_input = cmp_player_input.get_h();
		var _v_input = cmp_player_input.get_v();
		var _sprint_input = cmp_player_input.get_sprint();
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
			var _dash = cmp_player_input.get_dash();
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

// States
animation_state = cmp_animationState.init();
state = cmp_logicalState.init();

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
cont_camera.set_target(self)
	.set_look_ahead(true);

// Debug
cmp_debugPlayer.watches();
cmp_debugPlayer.parts_color_picker();
show_debug_overlay(false);