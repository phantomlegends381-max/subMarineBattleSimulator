shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float wave_speed = 3.0;
uniform float wave_freq = 10.0;
uniform float wave_width = 0.005;

void fragment() {
	vec2 uv = SCREEN_UV;
	// This math creates the "wobble" effect
	uv.x += sin(TIME * wave_speed + uv.y * wave_freq) * wave_width;
	uv.y += cos(TIME * wave_speed + uv.x * wave_freq) * wave_width;
	
	vec4 color = texture(SCREEN_TEXTURE, uv);
	// Optional: This adds a tiny bit of blue tint to everything
	COLOR = color * vec4(0.9, 0.9, 1.0, 1.0); 
}