// Function to convert a color to normalized RGB values
function color_normalized(_c) {
    return {
        r: color_get_red(_c) / 255.0,
        g: color_get_green(_c) / 255.0,
        b: color_get_blue(_c) / 255.0,
        a: 1.0 // Set alpha to 1.0 as default
    };
}

// Converts a 2×N or N×2 color array into a normalized struct array
function array_color_normalized(_a) {
    // create 2D array properly
    var _rows = array_length(_a);
    var _cols = array_length(_a[0]);
    
    var _new_array = array_create(_rows);
    for (var i = 0; i < _rows; i++) {
        _new_array[i] = array_create(_cols);
    }

    // fill normalized colors
    for (var i = 0; i < _rows; i++) {
        for (var n = 0; n < _cols; n++) {
            _new_array[i][n] = color_normalized(_a[i][n]);
        }
    }

    return _new_array;
}

// Function to set the shader and its uniforms
function shader_set_replace_colors(_color_array) {
    var _shd = shd_replace_color;

    // Activate the shader
    shader_set(_shd);
	
	// Normalize the colors
	var _norm_array = array_color_normalized(_color_array);
	
	var _o_array = [array_length(_norm_array)];
	var _n_array = [array_length(_norm_array)];
	for (var i = 0; i < array_length(_norm_array); i++) {
		_o_array[i] = _norm_array[i][0];
	}
	for (var i = 0; i < array_length(_norm_array); i++) {
		_n_array[i] = _norm_array[i][1];
	}
    var _oc1 = _o_array[0];
    var _nc1 = _n_array[0];
    var _oc2 = _o_array[1];
    var _nc2 = _n_array[1];

    // Set the original and new colors
    shader_set_uniform_f(shader_get_uniform(_shd, "originalColor1"), _oc1.r, _oc1.g, _oc1.b, _oc1.a);
    shader_set_uniform_f(shader_get_uniform(_shd, "newColor1"), _nc1.r, _nc1.g, _nc1.b, _nc1.a);
    shader_set_uniform_f(shader_get_uniform(_shd, "originalColor2"), _oc2.r, _oc2.g, _oc2.b, _oc2.a);
    shader_set_uniform_f(shader_get_uniform(_shd, "newColor2"), _nc2.r, _nc2.g, _nc2.b, _nc2.a);
}

