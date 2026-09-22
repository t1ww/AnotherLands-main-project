// TestEventListener.gml
function TestEventListener() {
	show_debug_message("Testing event listener");

	passed = 0;
	failed = 0;

	function assert(condition, name) {
		if (condition) {
			passed++;
			show_debug_message($"[PASS] {name}");
		} else {
			failed++;
			show_debug_message($"[FAIL] {name}");
		}
	}

	// --------------------------------------------------
	// Setup
	// --------------------------------------------------

	test_object = instance_create_depth(0, 0, 0, obj_disposable);

	callback_count = 0;
	received_data = undefined;

	callback = function(data) {
		callback_count++;
		received_data = data;
	};

	// --------------------------------------------------
	// event_assign + event_fire
	// --------------------------------------------------

	EVENT_LISTENER.event_assign(
		"test_event",
		test_object,
		callback
	);

	EVENT_LISTENER.event_fire(
		"test_event",
		12345
	);

	assert(
		callback_count == 1,
		"event_fire calls assigned listener"
	);

	assert(
		received_data == 12345,
		"event_fire passes event data"
	);

	// --------------------------------------------------
	// Multiple fires
	// --------------------------------------------------

	EVENT_LISTENER.event_fire("test_event", 67890);

	assert(
		callback_count == 2,
		"listener can receive multiple events"
	);

	assert(
		received_data == 67890,
		"listener receives latest event data"
	);

	// --------------------------------------------------
	// event_unassign
	// --------------------------------------------------

	EVENT_LISTENER.event_unassign(
		"test_event",
		test_object,
		callback
	);

	EVENT_LISTENER.event_fire(
		"test_event",
		99999
	);

	assert(
		callback_count == 2,
		"event_unassign prevents callback"
	);

	// --------------------------------------------------
	// event_overwrite
	// --------------------------------------------------

	overwrite_count = 0;

	original_callback = function(data) {
		callback_count++;
	};

	new_callback = function(data) {
		overwrite_count++;
		received_data = data;
	};

	EVENT_LISTENER.event_assign(
		"overwrite_test",
		test_object,
		original_callback
	);

	EVENT_LISTENER.event_overwrite(
		"overwrite_test",
		test_object,
		original_callback,
		new_callback
	);

	EVENT_LISTENER.event_fire(
		"overwrite_test",
		54321
	);

	assert(
		callback_count == 2,
		"event_overwrite removes original callback"
	);

	assert(
		overwrite_count == 1,
		"event_overwrite registers new callback"
	);

	assert(
		received_data == 54321,
		"overwritten callback receives event data"
	);

	// --------------------------------------------------
	// Cleanup
	// --------------------------------------------------

	instance_destroy(test_object);

	// Clean up test listeners because the object was destroyed.
	EVENT_LISTENER.event_unassign(
		"overwrite_test",
		test_object,
		new_callback
	);

	show_debug_message(
		$"TestEventListener: {passed} passed, {failed} failed"
	);

	return failed == 0;
}
