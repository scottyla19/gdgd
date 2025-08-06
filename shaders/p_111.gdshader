shader_type canvas_item;

#include "res://shaders/utilities.gdshaderinc"

uniform float mouse_x = 0.2;
uniform float mouse_y = 0.2;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {

	vec3 hsv = vec3(1.0, 1.0, 1.0);


	for (float grid_y = 0.0; grid_y<=1.0; grid_y+=mouse_y ) {
		for (float grid_x = 0.0; grid_x<=1.0; grid_x+=mouse_x ) {
			vec3 color_x = vec3(grid_x, hsv.y, hsv.z);
			vec3 color_y = vec3(hsv.x, 1.0 - grid_y, hsv.z );
			hsv = mix(hsv, color_x, step(grid_x, UV.x));
			hsv = mix(hsv, color_y, step(grid_y, UV.y));
		}
	}

	COLOR = vec4(hsv2rgb(hsv), 1.0);
}
