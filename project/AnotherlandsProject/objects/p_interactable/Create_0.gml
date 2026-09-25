/// @description > p_interactable create event
// > code here
focused = false; // being focused by mouse
key_interact = "E";

/// Function to run when interact
on_interact = function() {
	show_error("Interacted but on_interact not set.", false);
};

/// shader
handler = shader_get_uniform(shd_outline,"texture_Pixel");
handler_1 = shader_get_uniform(shd_outline,"thickness_power");
handler_2 = shader_get_uniform(shd_outline,"RGBA");
