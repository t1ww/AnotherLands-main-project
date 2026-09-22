// Quick creation: create at 0,0 depth 0
function instance_create(_object, _var_struct = null) {
	if (_var_struct == null) {
		instance_create_depth(0,0,0, _object);	
	} else {
		instance_create_depth(0,0,0, _object, _var_struct);
	}
}