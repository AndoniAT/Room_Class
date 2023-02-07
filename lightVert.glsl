#define PROCESSING_LIGHT_SHADER

uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;
attribute vec4 emissive;
attribute float shininess; 

varying vec4 vertColor;
varying vec4 vertEmissive;
varying float vertShininess;
varying vec3 ecNormal;
varying vec3 ecPosition;

void main() {
  gl_Position   = transform * position;
  ecPosition    = vec3(modelview * position);
  ecNormal      = normalize(normalMatrix * normal);
  vertEmissive  = emissive;
  vertColor     = color;
  vertShininess = shininess;
}
    