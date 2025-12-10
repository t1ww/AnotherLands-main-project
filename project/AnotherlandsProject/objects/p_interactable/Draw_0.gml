/// @description Insert description here
// You can write your code in this 
	if focused {
		// drawing the button hint
		draw_set_alpha(.5);
		draw_set_color(c_black);
		draw_rectangle(x-6, bbox_top - 16, x+6, bbox_top - 4, false);
		draw_set_default();
		draw_text(x, bbox_top-10, key_interact);
		// drawing outline
		shader_set(shd_outline);
		var tex=sprite_get_texture(sprite_index,image_index);
		var tex_w=texture_get_texel_width(tex);
		var tex_h=texture_get_texel_height(tex);
		shader_set_uniform_f(handler,tex_w,tex_h);
		shader_set_uniform_f(handler_1,1.5);//line thickness
		shader_set_uniform_f(handler_2,1.,1.,1.,1.);//b
	}
	draw_self();
	shader_reset();