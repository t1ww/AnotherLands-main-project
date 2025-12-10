/// @description obj_another_lands_door Create event
// code here >

// Inherit interactable
event_inherited();

// Randomizing target room of the door
// If at starting point
if (WORLD.current_index == -1) {
	// Get starting town
	next_index = WORLD.starting_index;
	next_town = WORLD.world_grid[next_index].room_index.room_id;
	target_room = next_town;
	
} else {
	// Get randomly next AL room or next town
	next_index = (WORLD.travel_direction == RIGHT)? WORLD.current_index + 1: WORLD.current_index -1;
	next_town = WORLD.world_grid[next_index].room_index.room_id;
	random_land = room_get_another_land(
		min(
			global.biomes_amount,
			WORLD.world_grid[WORLD.current_index].tier + min(choose(0,1),1)
		), 
		WORLD.travel_direction
	)
	target_room = choose(next_town, random_land);
}

script = function() {
	if (WORLD.generated != false) {
		if (target_room == next_town) {
			WORLD.current_index = next_index;	
		}
		change_room(target_room);
	}
};