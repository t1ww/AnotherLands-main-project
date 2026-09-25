/// @description > Create sky
// > code here
// Should move to sky controller
// Create sky if possible (suitable room)
if (layer_exists("scene")) {
	instance_create_layer(0,0, "scene", obj_sky);
}
