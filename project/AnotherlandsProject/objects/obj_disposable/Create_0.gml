/// @description  desc -- obj_disposable
// event : create
// code here >
// This object is for quick disposable use;
// Create, set step, set draw, and leave it.
create = undefined;

set_create = function(_func){
	create = _func;
}

step = undefined;

set_step = function(_func){
	step = _func;
}

draw = undefined;

set_draw = function(_func){
	draw = _func;
}

// Run create
if(is_callable(create)) {
	create();
}
