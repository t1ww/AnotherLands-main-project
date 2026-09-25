/// @description > cmp_animationState create event
// > code here
// Inherit the parent event
event_inherited();

/// /// ANIMATION STATE /// ///
init = function() {
	animation_state = new state_machine();
	with (animation_state) {
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
		
	return animation_state;
}
