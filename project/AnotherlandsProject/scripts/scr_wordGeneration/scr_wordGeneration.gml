// USER GENERATED SCRIPT	
// //
global.world = { 
	generated : false, 
	travel_direction : RIGHT,
	// defaults init
	world_grid : null,
	current_index : 0
};
#macro WORLD global.world

// ENUMERATORS
enum WORLD_SIZE {
	small, medium, large, extra_large
}

function get_world_size(_size) {
    var _base_size = 11;
    var WORLD_SIZE_VALUES = [0, 4, 8, 12];

    if (_size < 0 || _size >= array_length(WORLD_SIZE_VALUES)) {
        return -1;
    }

    return _base_size + WORLD_SIZE_VALUES[_size];
}

/// WORLD SETUP
// biome tier
global.biomes_amount = 2;
global.biome_tier_arrays = array_create(global.biomes_amount);
global.biome_tier_arrays[0] = {
	left  : [
				{name: "rm_forest_simple_left"	  , room_id: rm_forest_left_01},
			],
	right : [
				{name: "rm_forest_simple_right"	  , room_id: rm_forest_right_01},
				{name: "rm_forest_river_right"	  , room_id: rm_forest_right_02}, 
			],
	towns : [
				{name: "rm_forest_town"	  , room_id: rm_forest_town},
				{name: "rm_forest_village", room_id: rm_forest_village}
			]
};
global.biome_tier_arrays[1] = {
	left  : [{name: "rm_plains_simple_left" , room_id: rm_plains_left_01}],
	right : [{name: "rm_plains_simple_right", room_id: rm_plains_right_01}],
	towns : [{name: "rm_forest_city"		, room_id: rm_forest_city}]
};
global.biome_starter = {
	another_lands : [{name:"rm_start", room_id: rm_start}],
	towns : [{name:"rm_starter_town_1", room_id: rm_starter_town_01}],
}
global.biome_oceans_towns = {
	left  : [{name:"rm_ocean_village_left" , room_id: rm_ocean_village_left}],
	right : [{name:"rm_ocean_village_right", room_id: rm_ocean_village_right}],
}

// Randomize next anotherlands room
function room_get_another_land(_tier, _direction){
	if (_direction == RIGHT) {
		if(_tier == -1) {
			return array_choose(global.biome_oceans_towns.right);
		}
		return array_choose(global.biome_tier_arrays[_tier].right).room_id;
	} else 
	if (_direction == LEFT ) {
		if(_tier == -1) {
			return array_choose(global.biome_oceans_towns.left);
		}
		return array_choose(global.biome_tier_arrays[_tier].left).room_id;
	} else {
		throw
		show_debug_message("room_get_another_land is called without correct direction input");
		return -1;	
	}
}

// // GENERATE WORLD // //
WORLD.generate = function(_size, _seed = irandom(9999999)) {
// seed 
	SAVE_DATA.seed = _seed;
	random_set_seed(SAVE_DATA.seed);

// size
	WORLD[$ "world_size"] = _size;

	var _smallest_size = 11;
	var _grid_size = get_world_size(_size);
	
	// size
	WORLD.world_grid_size = _grid_size;
	WORLD.world_grid	  = array_create(WORLD.world_grid_size);
	// starting point
	var _middle_index = _grid_size div 2;
	WORLD[$ "starting_index"] = _middle_index;
	// tier gap
	var _tier_gap = (_middle_index - 2) div global.biomes_amount;
	var _tier_cap = 1;
	
	// left ocean
		WORLD.world_grid[0] = { 
			tier: -1, 
			room_index : array_choose(global.biome_oceans_towns.left) 
		};
	
	// left side
	for (var i = _middle_index -1, _tier_gap_count = 0, _tier = 0; i > 0; i--) {
		// world gen
	    WORLD.world_grid[i] = { 
			tier: _tier, 
			room_index : array_choose(global.biome_tier_arrays[_tier].towns) 
		};
		// incrementing
		if (_tier_gap_count++ >= _tier_gap) {
			if(_tier < _tier_cap) { _tier++; }
			_tier_gap_count = 0; // reset
		}
	}
	// starter
		WORLD.world_grid[WORLD.starting_index] = { 
			tier: 0, 
			room_index : array_choose(global.biome_starter.towns)
		};
	
	// right side
	for (var i = _middle_index + 1, _tier_gap_count = 0, _tier = 0; i < _grid_size - 1; i++) {
		// world gen
	    WORLD.world_grid[i] = { 
			tier: _tier, 
			room_index : array_choose(global.biome_tier_arrays[_tier].towns)
		};
		
		// incrementing
		if (_tier_gap_count++ >= _tier_gap) {
			if(_tier < _tier_cap) { _tier++; }
			_tier_gap_count = 0; // reset
		}
	}
	
	// right ocean
		WORLD.world_grid[_grid_size-1] = { 
			tier: -1, 
			room_index : array_choose(global.biome_oceans_towns.right) 
		};
	
	// setting index
	WORLD[$ "current_index"] = -1;
	WORLD.generated = true;
// reset seed
	randomize();
	{ // showing world in debug message
		var _str = "[";
		for (var i = 0; i < WORLD.world_grid_size-1; i++) {
			_str += string(WORLD.world_grid[i].tier) + ",";	
		}
		_str += string(WORLD.world_grid[WORLD.world_grid_size-1].tier);
		show_debug_message(_str + "]");
	}
}
