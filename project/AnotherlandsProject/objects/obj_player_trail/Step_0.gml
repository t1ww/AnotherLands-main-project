/// @description > obj_player_trail step event
// code here >
// Fade out
image_alpha -= .1;

// Destroy when fully transparent
if (image_alpha == 0) { 
	instance_destroy();
}
