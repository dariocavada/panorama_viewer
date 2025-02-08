#include <flutter/runtime_effect.glsl>
precision mediump float;

layout(location = 0) uniform float inputInvert;
layout(location = 1) uniform vec2 screenSize;

uniform sampler2D inputImageTexture;

out vec4 fragColor;

vec4 processColor(vec4 sourceColor) {
    vec3 invertedColor = mix(sourceColor.rgb, 1.0 - sourceColor.rgb, inputInvert);
    return vec4(invertedColor, sourceColor.a);
}

void main() {
    vec2 textureCoordinate = FlutterFragCoord().xy / screenSize;
    vec4 textureColor = texture(inputImageTexture, textureCoordinate);

    fragColor = processColor(textureColor);
}
