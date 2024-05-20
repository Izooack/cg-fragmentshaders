#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Fish Eye
    // This optical effect can be accomplished with a barrel distortion
    // In order to accomplish a barrel distortion, implement the following equations:
    // scale and translate the texture coordinate such that it is in the range [-1.0. 1.0]
    // multiply by 2, then subtract 1
    // calculate theta = arctan(texture_coordinate_y, texture_coordinate_x)
    // calculate radius = magnitude of texture coordinate, raised to the power of 1.5
    // calculate fish eye texture coordinate = (radius * cos(theta), radius * sin(theta))
    // re-scale final texture coordinate in range [0.0, 1.0]
    // final texture coordinate = 0.5 * (fish eye texture coordinate + 1.0)

    // Scale and translate the texture coordinate
    vec2 textCoord = (model_uv * 2.0) - 1.0;

    // Calculate theta
    float theta = atan(textCoord.y, textCoord.x);

    // Calculate radius
    float radius = pow(length(textCoord), 1.5);

    // Calculate fish eye texture coordinate
    vec2 fish_eye_textCoord = vec2(radius * cos(theta), radius * sin(theta));

    // Re-scale final texture coordinate
    vec2 final_textCoord = clamp(0.5 * (fish_eye_textCoord + 1.0), 0.0, 1.0);

    // Color
    FragColor = texture(image, final_textCoord);
}
