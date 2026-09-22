// DATA folder initilization
// So we can order the script runs
function scr_initializeData(){
	// Create all data first
	scr_create_globalData()
	scr_create_saveData()
	
	// Run config
	scr_create_config()
}
// Run this script
scr_initializeData();