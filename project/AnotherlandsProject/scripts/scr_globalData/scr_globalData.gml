// INITIALIZATION
// global data
global.Data = {};
#macro DATA global.Data
// Save data
global.Save_Data = {};
#macro SAVE_DATA global.Save_Data

// GAME DATA SETUPS
// strings for language management
// TODO: make into localization system loaded from json for future translations
// Note: english can stay in code as template, and write json file out
DATA [$ "Language"] = {};
with (DATA.Language) {
	english = {
		__main_menu__ : {
			__new_game__ : "New game",
			__setting__  : "Setting" ,
			__exit__	 : "Exit"		
		}
	}
	thai = {
		__main_menu__ : {
			__new_game__ : "เริ่มเกมใหม่",
			__setting__  : "ตั้งค่า" ,
			__exit__	 : "ออกเกม"		
		}
	}
}

/// ENEMY TYPES
enum ENTITY_MOVEMENT_TYPE {
	landed,
	flying,
	swimming,
}
