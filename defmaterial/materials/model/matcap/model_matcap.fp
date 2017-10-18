varying mediump vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;

uniform mediump mat4 world;
uniform mediump sampler2D tex0;
uniform mediump vec4 light;
uniform mediump vec4 peye;
uniform mediump vec4 camera_position;

vec2 matcap(vec3 eye, vec3 normal) {
  vec3 reflected = reflect(eye, normal);
  float m = 2.8284271247461903 * sqrt( reflected.z+1.0 );
  return reflected.xy / m + 0.5;
}


void main() {

  vec2 uv = matcap(camera_position.xyz, var_normal).xy;

  gl_FragColor = vec4(texture2D(tex0, uv).rgb,1.0);


}
