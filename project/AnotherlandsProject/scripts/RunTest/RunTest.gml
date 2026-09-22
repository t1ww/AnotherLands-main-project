// Script to run actual tests
function RunTest() {
	// Prints
	show_debug_message("-----------------------------------------");
	show_debug_message("Running tests");
	show_debug_message("-----------------------------------------");
	
	// Calls
	TestEventListener();
	TestRandom();
}

call_later(1, time_source_units_frames, function() {
	RunTest();
});
