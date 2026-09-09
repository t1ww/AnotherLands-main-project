// CONFIG
global.config_variables = {};
#macro CONFIG global.config_variables
with (CONFIG) {
	language = DATA.Language.english;
	
	// Save config
		save = function() {
			// save variables here
			var _save = variables_list;
		}
	// Load config
		load = function() {}
		
	load();
}