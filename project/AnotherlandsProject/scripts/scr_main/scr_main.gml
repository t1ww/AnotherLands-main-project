// Main script of the game
// Anything that should sync as config for the whole game
var _titles = [
		"AnotherLands WIP", 
		"Something funny here",
		"Try out terraria!",
		"I also like starbound!",
		"Have you tried using magic?"
	];
randomise();
global.chosenTitle = array_choose(_titles);
#macro TITLE global.chosenTitle

/// Constants
// Variables
#macro null undefined
#macro START_ROOM rm_start

// ==================================
// GAME RESOLUTION (logical size)
// ==================================
#macro GAME_WIDTH  640
#macro GAME_HEIGHT 360

// ==================================
// WINDOW / SCREEN SIZE (default output size)
// ==================================
#macro WINDOW_WIDTH  1280
#macro WINDOW_HEIGHT 720

// Directions
#macro RIGHT 1
#macro LEFT -1

// Mouse coords to gui
#macro mouse_x_gui device_mouse_x_to_gui(0)
#macro mouse_y_gui device_mouse_y_to_gui(0)
