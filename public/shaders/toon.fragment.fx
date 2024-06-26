#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Toonify
    // This filter will round each color component to one of 5 levels (0.0, 0.25, 0.5, 0.75, 1.0)
    // Rounding can be done by multiplying by 4.0, then rounding, then dividing by 4.0
    // The result should be a cartoon-ish looking image

    // Color
    vec4 color = texture(image, model_uv);

    FragColor = round(color * 4.0) / 4.0;
}
