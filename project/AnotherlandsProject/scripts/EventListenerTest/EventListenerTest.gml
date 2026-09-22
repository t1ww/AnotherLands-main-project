function EventListenerTest(){
	// Test event listener
	if (cont_input.check_all(vk_shift, vk_enter, ord("L"))) {
		obj_player_controller.character_destroy();
	}
	
    pressed_button_counter = function() {
		static enter_pressed_counter = 0;
		return ++enter_pressed_counter;
	}
	if (cont_input.check_pressed(vk_enter)) {
		EVENT_LISTENER.event_fire("pressed_button", pressed_button_counter());
	}
}
