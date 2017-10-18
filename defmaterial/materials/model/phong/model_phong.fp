varying mediump vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;

uniform mediump mat4 world;
uniform mediump sampler2D tex0;
uniform mediump vec4 light;
uniform mediump vec4 camera_position;

void main() {

    // World values
    vec3 viewDirectionW = normalize(camera_position.xyz - var_position.xyz);
    
    // Light
    vec3 lightVectorW = normalize(light.xyz - var_position.xyz);
    vec3 color = texture2D(tex0, var_texcoord0).rgb;
    
    // diffuse
    float ndl = max(0., dot(var_normal, lightVectorW));
    
    // Specular
    vec3 angleW = normalize(viewDirectionW + lightVectorW);
    float specComp = max(0., dot(var_normal, angleW));
    specComp = pow(specComp, max(1., 64.)) * 2.;
    
    gl_FragColor = vec4(color * ndl + vec3(specComp), 1.);



}
