#define PROCESSING_LIGHT_SHADER
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform int lightCount;
uniform vec4 lightPosition[8];
uniform vec3 lightDiffuse[8];
uniform vec3 lightAmbient[8];
uniform vec3 lightSpecular[8];

varying vec4 vertColor;
varying vec4 vertEmissive;
varying float vertShininess;
varying vec3 ecNormal;
varying vec3 ecPosition;

float lambertFactor(vec3 lightDir, vec3 vecNormal) {
    return max(0.0, dot(lightDir, vecNormal));
}

float blinnPhongFactor(vec3 lightDir, vec3 vertPos, vec3 vecNormal, float shininess) {
  vec3 np = normalize(vertPos);
  vec3 ldp = normalize(lightDir - np);
  return pow(max(0.0, dot(ldp, vecNormal)), shininess);
}

void main() {
  vec3  dfColor = vec3(0);
  vec3  amColor = vec3(0);
  vec3  spColor = vec3(0);
  vec3  normal  = normalize(ecNormal);

  if(vertEmissive.x > 0 || vertEmissive.y > 0 || vertEmissive.z > 0) {
    gl_FragColor = vertEmissive;
  } else {
    for(int i=0; i<lightCount; i++) {
        vec3  lightDir  = normalize(lightPosition[i].xyz - ecPosition);
        float intensity = lambertFactor(lightDir, normal);
        float spec      = blinnPhongFactor(lightDir, ecPosition, normal, vertShininess);
    
        dfColor += vertColor.rgb * lightDiffuse[i] * intensity;
        spColor += lightSpecular[i] * spec;
        amColor += lightAmbient[i];
      }

    gl_FragColor = vec4(dfColor + amColor + spColor, vertColor.a);
  }
}
