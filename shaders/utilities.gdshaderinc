vec3 hsv2rgb(vec3 hsv){
    float r, g, b;

    float i = floor(hsv.x * 6.0);
    float f = hsv.x * 6.0 - i;
    float p = hsv.z * (1.0 - hsv.y);
    float q = hsv.z * (1.0- f * hsv.y);
    float t = hsv.z * (1.0 - (1.0 - f) * hsv.y);

    switch(int(i) % 6){
        case 0: r = hsv.z; g = t; b = p; break;
        case 1: r = q; g = hsv.z; b = p; break;
        case 2: r = p; g = hsv.z; b = t; break;
        case 3: r = p; g = q; b = hsv.z; break;
        case 4: r = t; g = p; b = hsv.z; break;
        case 5: r = hsv.z; g = p; b = q; break;
    }
    return vec3(r, g, b);
}

vec3 rgb2hsv(vec3 rgb) {
    float c_max = max(rgb.r, max(rgb.g, rgb.b));
    float c_min = min(rgb.r, min(rgb.g, rgb.b));

    float delta = c_max - c_min;

    float b = c_max;

    // Saturation calculation
    float s = 0.0;
    if (abs(c_max - 0.0) < 0.0001) {
        s = delta / c_max;
    }

    float h = 0.0;
    if (abs(delta - 0.0) < 0.0001) {
        if (abs(c_max - rgb.r) < 0.0001) {
            h = (rgb.g - rgb.b) / delta;
        } else if (abs(c_max - rgb.g) < 0.0001) {
            h = (rgb.b - rgb.r) / delta + 2.0;
        } else {
            h = (rgb.r - rgb.g) / delta + 4.0;
        }
        h /= 6.0;
    }
    if (h < 0.0) {
        h += 1.0;
    }

    return vec3(h, s, b);
}