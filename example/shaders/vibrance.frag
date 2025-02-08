#include <flutter/runtime_effect.glsl>
precision mediump float;

layout(location = 0) uniform float inputVibrance; // MUST match Dart code
layout(location = 1) uniform vec2 screenSize;

uniform sampler2D inputImageTexture;

out vec4 fragColor;

vec4 processColor(vec4 sourceColor) {
    float maxChannel = max(sourceColor.r, max(sourceColor.g, sourceColor.b));
    float avg = (sourceColor.r + sourceColor.g + sourceColor.b) / 3.0;
    float intensity = (maxChannel - avg) * 2.0;

    vec3 vibranceColor = mix(vec3(avg), sourceColor.rgb, 1.0 + inputVibrance * intensity);

    return vec4(clamp(vibranceColor, 0.0, 1.0), sourceColor.a);
}

void main() {
    vec2 textureCoordinate = FlutterFragCoord().xy / screenSize;
    vec4 textureColor = texture(inputImageTexture, textureCoordinate);

    fragColor = processColor(textureColor);
}
