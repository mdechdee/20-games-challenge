shader_type canvas_item;
render_mode unshaded;

uniform vec4 line_color : source_color = vec4(1);
uniform float line_thickness : hint_range(0, 10) = 1.0;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
    vec2 size = SCREEN_PIXEL_SIZE * line_thickness;

    // Calculate outline
    float outline = texture(screen_texture, SCREEN_UV + vec2(-size.x, 0)).a;
    outline += texture(screen_texture, SCREEN_UV + vec2(0, size.y)).a;
    outline += texture(screen_texture, SCREEN_UV + vec2(size.x, 0)).a;
    outline += texture(screen_texture, SCREEN_UV + vec2(0, -size.y)).a;
    outline += texture(screen_texture, SCREEN_UV + vec2(-size.x, size.y)).a;
    outline += texture(screen_texture, SCREEN_UV + vec2(size.x, size.y)).a;
    outline += texture(screen_texture, SCREEN_UV + vec2(-size.x, -size.y)).a;
    outline += texture(screen_texture, SCREEN_UV + vec2(size.x, -size.y)).a;
    outline = min(outline, 1.0);

    // Apply the outline to the screen texture
    vec4 color = texture(screen_texture, SCREEN_UV);
    COLOR = mix(color, line_color, outline - color.a);
}