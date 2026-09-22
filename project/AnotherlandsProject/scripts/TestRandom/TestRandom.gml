// scripts/TestRandom.gml
function TestRandom() {
	show_debug_message("Testing random functions");

	passed = 0;
	failed = 0;

	function assert(actual, expected, name) {
		if (actual == expected) {
			passed++;
			show_debug_message($"[PASS] {name}: {actual}");
		} else {
			failed++;
			show_debug_message($"[FAIL] {name}: expected {expected}, got {actual}");
		}
	}

	// Seeded random sequence
	random_set_seed(12345);

	assert(irandom(1000), 968, "Seed 12345 - value 1");
	assert(irandom(1000), 432, "Seed 12345 - value 2");
	assert(irandom(1000), 713, "Seed 12345 - value 3");

	// Same seed should produce the same sequence
	random_set_seed(12345);

	assert(irandom(1000), 968, "Repeat seed 12345 - value 1");
	assert(irandom(1000), 432, "Repeat seed 12345 - value 2");
	assert(irandom(1000), 713, "Repeat seed 12345 - value 3");

	show_debug_message($"TestRandom: {passed} passed, {failed} failed");

	return failed == 0;
}
