varying mediump vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;

uniform mediump mat4 world;
uniform mediump sampler2D diffuse;
uniform mediump sampler2D normal;
uniform mediump vec4 light;
uniform mediump vec4 camera_position;

void main() {

    // World values
    vec3 viewDirectionW = normalize(camera_position.xyz - var_position.xyz);
    
    // Light
    vec3 lightVectorW = normalize(light.xyz - var_position.xyz);
    vec3 color = texture2D(diffuse, var_texcoord0).rgb;
	vec3 normal_texture = texture2D(normal, var_texcoord0).xyz;

	normal_texture = normalize(normal_texture * 2.0 - 1.0);
    
    // diffuse
    float ndl = max(0.1, dot(var_normal + normal_texture, lightVectorW));
    
    // Specular
    vec3 angleW = normalize(viewDirectionW + lightVectorW);
    float specComp = min(1.0, max(0., dot(mix(var_normal, normal_texture, 0.5), angleW)));
    specComp = pow(specComp, max(1., 64.)) * 2.;
    
    gl_FragColor = vec4(color * ndl + vec3(specComp), 1.);



}
