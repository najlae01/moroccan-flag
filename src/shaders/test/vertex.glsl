//   uniform mat4 projectionMatrix;
//   uniform mat4 viewMatrix;
//   uniform mat4 modelMatrix;
  uniform vec2 uFrequency;
  uniform float uTime;
  uniform vec3 uBackColor;

//   attribute vec3 position;
//   attribute float aRandom;
//   attribute vec2 uv;

//   varying float vRandom;
  varying vec2 vUv;
  varying float vElevation;
  varying vec3 vPosition;
  varying vec3 vNormal;
  varying vec3 vBackColor;

  void main()
  {
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    float elevation = sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    elevation += sin(modelPosition.y * uFrequency.y - uTime * 0.1) * 0.1;

    modelPosition.z += elevation;
    // modelPosition.z += aRandom * 0.1;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0); 

    // vRandom = aRandom;
    vUv = uv;
    vElevation = elevation;
    vPosition = position;
    vNormal = normal;
    vBackColor = uBackColor;
  }