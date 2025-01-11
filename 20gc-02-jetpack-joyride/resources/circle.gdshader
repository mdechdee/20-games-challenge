shader_type canvas_item;
varying vec4 vertex_color;

void vertex() {
  vertex_color = COLOR;
}

void fragment() {
	float rad = length(UV * 2.0 - 1.0);
	COLOR.a = vertex_color.a * step(rad, 1.0);
}
