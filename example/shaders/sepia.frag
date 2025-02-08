#include <flutter/runtime_effect.glsl>
precision mediump float;

layout(location = 0) uniform float inputSepia;
layout(location = 1) uniform vec2 screenSize;

uniform sampler2D inputImageTexture;

out vec4 fragColor;

vec4 processColor(vec4 sourceColor) {
    vec3 sepiaColor = vec3(
        dot(sourceColor.rgb, vec3(0.393, 0.769, 0.189)),
        dot(sourceColor.rgb, vec3(0.349, 0.686, 0.168)),
        dot(sourceColor.rgb, vec3(0.272, 0.534, 0.131))
    );
    
    vec3 finalColor = mix(sourceColor.rgb, sepiaColor, inputSepia);
    return vec4(finalColor, sourceColor.a);
}

void main() {
    vec2 textureCoordinate = FlutterFragCoord().xy / screenSize;
    vec4 textureColor = texture(inputImageTexture, textureCoordinate);

    fragColor = processColor(textureColor);
}
