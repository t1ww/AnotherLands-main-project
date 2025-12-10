/// @description Inherit the parent event
event_inherited();

// code here >
script = function(){
	if (WORLD.generated != false) {
		WORLD.travel_direction = travel_direction;
		change_room( 
			room_get_another_land(WORLD.world_grid[WORLD.current_index].tier, WORLD.travel_direction) 
		);
	}
};