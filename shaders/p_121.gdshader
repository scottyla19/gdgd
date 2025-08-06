shader_type canvas_item;

#include "res://shaders/utilities.gdshaderinc"

uniform float mouse_x = 0.2;
uniform float mouse_y = 0.2;
//const float[10] color_array

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 dims = vec2(10. * mouse_x, 10. * mouse_y);
	vec2 uv_frac = fract(UV * dims);
	vec2 uv_int = floor(UV * dims);
	int row_num = int(uv_int.y);
	
	vec3 hsv = vec3(uv_int.y/10., 1.0, 1.0);
	hsv = mix(hsv, vec3(fract(hsv.x + uv_int.x/10.) , 1.0, 1.0), step(uv_int.x/100., UV.x));
	hsv = mix(hsv + uv_frac.y, vec3(fract(hsv.x + uv_int.y/10.), 1.0, 1.0), step(uv_int.y/10., UV.y));
	COLOR = vec4(hsv2rgb(hsv), 1.0);
}
