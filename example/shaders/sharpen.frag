#include <flutter/runtime_effect.glsl>
precision mediump float;

layout(location = 0) uniform float inputSharpen;
layout(location = 1) uniform vec2 screenSize;

uniform sampler2D inputImageTexture;

out vec4 fragColor;

vec4 processColor(vec2 textureCoordinate) {
    if (inputSharpen <= 0.0) {
        return texture(inputImageTexture, textureCoordinate);
    }

    vec2 texelSize = 1.0 / screenSize;

    vec4 center = texture(inputImageTexture, textureCoordinate);
    vec4 north = texture(inputImageTexture, textureCoordinate + vec2(0.0, texelSize.y));
    vec4 south = texture(inputImageTexture, textureCoordinate - vec2(0.0, texelSize.y));
    vec4 east = texture(inputImageTexture, textureCoordinate + vec2(texelSize.x, 0.0));
    vec4 west = texture(inputImageTexture, textureCoordinate - vec2(texelSize.x, 0.0));

    // Scale the sharpening effect to match the WebGl Version
    float scaledSharpen = inputSharpen * 0.15;

    // Apply sharpening kernel
    vec3 sharpenedColor = center.rgb * (1.0 + 4.0 * scaledSharpen) 
                          - (north.rgb + south.rgb + east.rgb + west.rgb) * scaledSharpen;

    return vec4(clamp(sharpenedColor, 0.0, 1.0), center.a);
}

void main() {
    vec2 textureCoordinate = FlutterFragCoord().xy / screenSize;

    fragColor = processColor(textureCoordinate);
}
