shader_type canvas_item;

uniform sampler2D perlin_noise: repeat_enable;
uniform sampler2D cell_noise: repeat_enable;

#define pow3(x) (x * x * x)

void fragment() {
	//vec2 uv1 = vec2(UV.x + TIME * .06, UV.y + TIME * .005);
	//vec2 uv2 = vec2(UV.x + TIME * .065, UV.y + TIME * .005);
	vec2 uv1 = vec2(UV.x + TIME * .01, UV.y + TIME * .005);
	vec2 uv2 = vec2(UV.x + TIME * .015, UV.y + TIME * .005);
	float noise1 = smoothstep(.1, .8, texture(perlin_noise, uv1).r * 2.3);
	float noise2 = smoothstep(.2, 1.0, texture(perlin_noise, uv2).r * 1.0);
	
	float noise = smoothstep(noise1 * noise2 * pow3(UV.y), .0, .3);
	
	COLOR = vec4(1,1,1, noise);
}
