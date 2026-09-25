/// @description > obj_debug_features RoomStart event
// Set collision layer's visibility
var _layer = layer_get_id("collision");
layer_set_visible(_layer, dbg_collision_visible);