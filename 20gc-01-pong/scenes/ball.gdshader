shader_type canvas_item;

global uniform vec4 default_color;

void fragment() {
	float radius = length(UV*2.0 - 1.0);
	COLOR = vec4(default_color.rgb, step(radius, 1.0) * default_color.a);
}
