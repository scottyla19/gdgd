shader_type canvas_item;

#include "res://shaders/utilities.gdshaderinc"

uniform int segment_count: hint_enum("6:6", "12:12", "24:24", "45:45", "360:360") = 12;


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 center = vec2(0.5);
  	float dist = distance(UV , center);
	
	// calculate angle
	vec2 dir = (UV - center) ;
    float angle = atan(dir.y, dir.x) / PI ;
  	angle = (angle + 1.0)/2.0;
	
	// determine color from the angle based on current segment
	// is there a better way than using a loop?
	float h = 0.0;
   	for (float i = 0.0; i<float(segment_count); i+=1.0){
		float max_angle = i/float(segment_count);
		h = mix(h, max_angle , step(max_angle, abs(angle)));
	}
  	
	// set the color at each pixel
	COLOR = vec4(hsv2rgb(vec3(h, 1.0, 1.0)), 1.0);
	
	// limit the color to only inside the wheel
	float radius = 1.0 - step(0.5, dist);
	COLOR *= radius;
}
