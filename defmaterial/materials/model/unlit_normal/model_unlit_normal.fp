varying mediump vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;

uniform mediump sampler2D tex0;

void main() {

    gl_FragColor = texture2D(tex0, var_texcoord0.xy); // RGBA color vector.
}
