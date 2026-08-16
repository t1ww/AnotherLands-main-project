/// @description  desc -- obj_disposable
// event : create
// code here >
// This object is for quick disposable use;
// Create, set step, set draw, and leave it.
step = undefined;

set_step = function(_func){
	step = _func;
}

draw = undefined;

set_draw = function(_func){
	draw = _func;
}
