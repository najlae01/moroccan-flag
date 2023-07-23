precision mediump float;

// varying float vRandom;
varying vec2 vUv;
varying float vElevation;
uniform sampler2D uTexture;

void main()
{
    vec4 textureColor = texture2D(uTexture, vUv);
    textureColor.rgb += vElevation * 1.5 + 0.025;
    gl_FragColor = textureColor;
}