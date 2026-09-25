/// @description interaction
// > code here
if (cont_interactings.nearest_interact == id) {
	focused = true;
} else {
	focused = false;	
}

// key interact press
if (cont_interactings.check_pressed(ord(key_interact)) 
	&& focused) {
	// run the script
	on_interact();
}
