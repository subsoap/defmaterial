varying mediump vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;

uniform mediump sampler2D tex0;

void main() {

    //gl_FragColor = texture2D(tex0, var_texcoord0.xy);

float luminance = dot(texture2D(tex0, var_texcoord0.xy).rgb, vec3(0.3, 0.59, 0.11));
    gl_FragColor = vec4(luminance, luminance, luminance, 1.0);

}
