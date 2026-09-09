// Random test
function test() {
	show_debug_message("Testing random functions");
	show_debug_message("Randomised")
	randomise();

	show_debug_message(irandom(1000)); // random
	show_debug_message(irandom(1000)); // random

	show_debug_message("Seeded 12345")
	random_set_seed(12345);
	show_debug_message(irandom(1000)); // 968
	show_debug_message(irandom(1000)); // 432
	show_debug_message(irandom(1000)); // 713

	show_debug_message("Randomised again")
	randomise();

	show_debug_message(irandom(1000)); // random
	show_debug_message(irandom(1000)); // random	
}