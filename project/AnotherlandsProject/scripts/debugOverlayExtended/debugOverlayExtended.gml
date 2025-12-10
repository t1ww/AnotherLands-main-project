// DBG EXTENDED LIBRARY
global.dbg_Overlay = {}
#macro DBG_OVERLAY global.dbg_Overlay
with (DBG_OVERLAY) {
	add_variable = function(_inst,_variable_name){
	    var _ref = ref_create(_inst,_variable_name);
	    dbg_text($"{_variable_name} : ");
	    dbg_same_line();
	    dbg_text(_ref);
	}
	add_variable_labeled = function(_inst,_label,_variable_name){
	    var _ref = ref_create(_inst,_variable_name);
	    dbg_text($"{_label} : ");
	    dbg_same_line();	
	    dbg_text(_ref);
	}
	// view
	create_view = function() constructor {
		
	}
	// section
	create_section = function() constructor {
		
	}
// try adding these into event listener 
	update = function() {}
	// delete all and re create all
}