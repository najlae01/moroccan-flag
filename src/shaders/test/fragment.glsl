// precision mediump float;

// varying float vRandom;
varying vec2 vUv;
varying float vElevation;
varying vec3 vPosition;
varying vec3 vNormal;
varying vec3 vBackColor;
uniform sampler2D uTexture;

void main()
{
    // Check if the fragment is facing the front side (dot product with the normal)
    bool isFrontSide = dot( vNormal, normalize( cameraPosition - vPosition ) ) > 0.0;

    if (isFrontSide) {
        vec4 textureColor = texture2D(uTexture, vUv);
        textureColor.rgb += vElevation * 1.5 + 0.025;
        gl_FragColor = textureColor;
    } else {
        gl_FragColor = vec4(vBackColor - vElevation * 1.5 - 0.025, 1.0);
    }
}