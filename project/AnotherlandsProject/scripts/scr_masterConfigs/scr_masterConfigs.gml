#macro TITLE "Title 2"

// user created scripted
#region /// Constants
	// null
	#macro null undefined
	
    // ==================================
    // GAME RESOLUTION (logical size)
    // ==================================
    #macro GAME_WIDTH  640
    #macro GAME_HEIGHT 360
    
    // ==================================
    // WINDOW / SCREEN SIZE (output size)
    // ==================================
    #macro WINDOW_WIDTH  1280
    #macro WINDOW_HEIGHT 720

	// Directions
	#macro RIGHT 1
	#macro LEFT -1

	// Mouse coords to gui
	#macro mouse_x_gui device_mouse_x_to_gui(0)
	#macro mouse_y_gui device_mouse_y_to_gui(0)
#endregion

#region /// Config
    // Initializations
    #macro START_ROOM rm_start
    #macro ADMIN false
    #macro TESTING false
    #macro DEVELOPMENT false
    
    // DEV mode
    #macro Development:START_ROOM rm_start
    #macro Development:TESTING true
    #macro Development:DEVELOPMENT true
    
    // Release mode
    #macro Release:START_ROOM rm_mainMenu
    #macro Release:DEVELOPMENT false
    
    // Release mode (Skip tutorial)
    // { nothing atm }
#endregion