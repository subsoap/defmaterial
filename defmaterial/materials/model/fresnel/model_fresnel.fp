varying mediump vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;

uniform mediump sampler2D tex0;
uniform mediump vec4 camera_position;

void main() {

    vec3 color = vec3(1., 1., 1.);
    vec3 viewDirectionW = normalize(camera_position - var_position);

    // Fresnel
	float fresnelTerm = dot(viewDirectionW, var_normal);
	fresnelTerm = clamp(1.0 - fresnelTerm, 0., 1.);

    gl_FragColor = vec4(color * fresnelTerm, 1.);

}
