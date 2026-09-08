shader_type canvas_item;

uniform float speed : hint_range(0.1, 5.0) = 1.0;
uniform float width : hint_range(0.01, 0.5) = 0.15;
uniform vec4 shine_color : source_color = vec4(1.0, 1.0, 0.9, 0.6);

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    float diagonal = UV.x + UV.y;
    float t = mod(TIME * speed, 2.0) - 0.5;
    float shine = smoothstep(t - width, t, diagonal) - smoothstep(t, t + width, diagonal);
    vec3 final_color = tex.rgb + shine_color.rgb * shine * shine_color.a;
    COLOR = vec4(final_color, tex.a);
}