/// @description setup

	focused = false; // being focused by mouse

	key_interact = "E";
/// scripts to run when interact
	script = function(){};

/// shader
	handler = shader_get_uniform(shd_outline,"texture_Pixel");
	handler_1 = shader_get_uniform(shd_outline,"thickness_power");
	handler_2 = shader_get_uniform(shd_outline,"RGBA");