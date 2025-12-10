// Simple passthrough fragment shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// The original colors to be replaced
uniform vec4 originalColor1;
uniform vec4 newColor1;
uniform vec4 originalColor2;
uniform vec4 newColor2;

void main() {
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);

    // Calculate the difference between the current color and the original color
    float diff1 = length(texColor.rgb - originalColor1.rgb);
    float diff2 = length(texColor.rgb - originalColor2.rgb);

    // If the difference is small enough, use the new color
    if (diff1 < 0.05) {
        texColor = newColor1;
    } else if (diff2 < 0.05) {
        texColor = newColor2;
    }

    gl_FragColor = texColor * v_vColour;
}
