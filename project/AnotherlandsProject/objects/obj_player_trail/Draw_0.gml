/// @description > obj_player_trail draw event
// code here >
// Setting blendmode for the effect
gpu_set_blendmode(bm_add);
draw_self();
gpu_set_blendmode(bm_normal);