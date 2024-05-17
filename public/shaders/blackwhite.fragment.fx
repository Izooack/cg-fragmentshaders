#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Black and White shader
    // Luminance is calculated as L = 0.299*R + 0.587*G + 0.114*B
    // Black and white images are created by assigning
    // the luminance value to all three color channels

    // Color
    vec4 color = texture(image, model_uv);

    float lumiance = 0.299 * color.r + 0.587 * color.g + 0.114 * color.b;

    FragColor = vec4(lumiance, lumiance, lumiance, 1.0);

}
