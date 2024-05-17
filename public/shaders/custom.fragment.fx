#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Negative Color Shader
    vec4 color = texture(image, model_uv);

    FragColor = vec4(1.0 - color.r, 1.0 - color.g, 1.0 - color.b, 1.0);
}
