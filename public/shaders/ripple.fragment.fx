#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float time;

// Output
out vec4 FragColor;

void main() {
    // Ripple
    // This filter creates a ripple effect similar to dropping a pebble in a pond
    // In order to accomplish a ripple effect, implement the following equations:
    // scale and translate the texture coordinate such that it is in the range [-1.0, 1.0]
    // multiply by 2, then subtract 1
    // calculate radius = magnitude of texture coordinate
    // calculate a texture coordinate offset = texture_coordinate * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0
    // calculate final texture coordinate = original_texture_coordinate + texture_coordinate_offset

    // Scale and translate the texture coordinate
    vec2 textCoord = (model_uv * 2.0) - 1.0;

    // Calculate radius
    float radius = length(textCoord);

    // Calculate texture coordinate offset
    vec2 textCoordOffset = textCoord * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0;

    // Calculate final texture coordinate
    vec2 final_textCoord = model_uv + textCoordOffset;

    // Color
    FragColor = texture(image, final_textCoord);
}
