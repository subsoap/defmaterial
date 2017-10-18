varying mediump vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;

uniform mediump mat4 world_view;

uniform mediump sampler2D tex0;
uniform mediump vec4 light;

void main() {

    vec3 e = normalize( vec3( world_view * var_position ) );
    vec3 n = normalize( world_view * vec4(var_normal, 0.0) ).xyz;

    vec3 r = reflect( e, n );
    float m = 2. * sqrt(
        pow( r.x, 2. ) +
        pow( r.y, 2. ) +
        pow( r.z + 1., 2. )
    );
    vec2 vN = r.xy / m + .5;

    vec3 base = texture2D( tex0, vN).rgb;

    gl_FragColor = vec4( base, 1. );

}
