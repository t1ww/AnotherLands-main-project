/// @description interaction
// > code here
if(cont_game.nearest_interact == id){
	focused = true;
}else focused = false;

// key interact press
if cont_input.check_pressed(ord(key_interact)) && focused {
	// run the script
	script();
}
