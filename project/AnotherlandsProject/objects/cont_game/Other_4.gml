/// @description > Set collision layer's visibility
// > code here

// Set collision layer's visibility
var _layer = layer_get_id("collision");
layer_set_visible(_layer,collision_visible);

// Create sky if possible (suitable room)
if (layer_exists("scene")) {
	instance_create_layer(0,0, "scene", obj_sky);
}