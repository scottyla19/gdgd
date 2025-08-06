shader_type canvas_item;

#include "res://shaders/utilities.gdshaderinc"

uniform float rect_size = 0.2;
uniform float color_base = 0.2;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 centered_uv = UV - vec2(0.5, 0.5);

    float half_width = rect_size / 2.0;
    float half_height = rect_size / 2.0;

    float is_inside_x = step(-half_width, centered_uv.x) * step(centered_uv.x, half_width);
    float is_inside_y = step(-half_height, centered_uv.y) * step(centered_uv.y, half_height);

	vec3 outer_color_rgb = hsv2rgb(vec3(color_base, 1.0 , 1.0));
	vec3 inner_color_rgb = hsv2rgb(vec3(1.0 - color_base, 1.0 , 1.0));

    float rectangle_mask = is_inside_x * is_inside_y;

	// Maybe use step here instead of if?
	if (rectangle_mask == 0.0){
		COLOR = vec4(outer_color_rgb, 1.0);
	}else{
		COLOR = vec4(inner_color_rgb, 1.0);
	}

}
