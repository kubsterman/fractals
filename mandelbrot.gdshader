shader_type canvas_item;

uniform float zoom = 1.0;
uniform vec2 offset = vec2(0,0);

void fragment() {
	vec2 uv = UV - 0.5;
	vec2 z = vec2(0,0);
	vec2 c = uv * zoom + offset;
	
	float iterations = 0.0;
	int max_iterations = 20000;
	
	for (int i = 0; i < max_iterations; i++){
		z = vec2(z.x * z.x - z.y * z.y, 2.0 * z.x * z.y) + c;
		if (length(z) > 2.0){
			break;
		}
		iterations++;
	}
	float color = iterations / float(max_iterations);
	COLOR = vec4(color,color,color,1.0);
}
