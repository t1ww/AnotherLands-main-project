// parent_components
persistent = true; // Component stay alive
visible = false; // Component stay hidden

// Init pass in instance to run
on_init = function() {
	show_debug_message("Component on_init not set");	
}

init_on_instance = function(_instance) {
	// Run on_init with _instance
    method(_instance, on_init)();
}

// Do whatever
