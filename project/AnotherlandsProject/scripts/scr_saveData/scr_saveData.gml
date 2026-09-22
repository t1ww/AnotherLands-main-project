// SAVE DATA
function scr_create_saveData() {
	global.Save_Data = {};
	#macro SAVE_DATA global.Save_Data

	/// id for player client (will use their account id)
	SAVE_DATA [$ "client_id"] = 0;
	
	/// world saves
	SAVE_DATA [$ "character_save_slot"] = 0;
	SAVE_DATA [$ "world_save_slot"]		= 0;
	SAVE_DATA [$ "seed"] = 0; // seed for world generation
	SAVE_DATA [$ "latest_saved_room"] = START_ROOM;
	
	/// statistics
	SAVE_DATA [$ "statistics"] = [
		{ name : "kill_count"		, amount : 0 },
		{ name : "rooms_travelled"	, amount : 0 },
		{ name : "npc_greeted"		, amount : 0 },
	];
}
