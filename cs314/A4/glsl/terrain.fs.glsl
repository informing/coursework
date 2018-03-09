//VARYING VAR
varying vec3 Normal_V;
varying vec3 Position_V;
varying vec4 PositionFromLight_V;
varying vec2 Texcoord_V;

varying mat4 mvMatrix;
varying vec4 shadowCoord;

//UNIFORM VAR
uniform vec3 lightColorUniform;
uniform vec3 ambientColorUniform;
uniform vec3 lightDirectionUniform;

uniform float kAmbientUniform;
uniform float kDiffuseUniform;
uniform float kSpecularUniform;
uniform float shininessUniform;

uniform sampler2D colorMap;
uniform sampler2D normalMap;
uniform sampler2D aoMap;
uniform sampler2D shadowMap;

// PART D)
// Use this instead of directly sampling the shadowmap, as the float
// value is packed into 4 bytes as WebGL 1.0 (OpenGL ES 2.0) doesn't
// support floating point bufffers for the packing see depth.fs.glsl
float getShadowMapDepth(vec2 texCoord)
{
	vec4 v = texture2D(shadowMap, texCoord);
	const vec4 bitShift = vec4(1.0, 1.0/256.0, 1.0/(256.0 * 256.0), 1.0/(256.0*256.0*256.0));
	return dot(v, bitShift);	
}

void main() {
	// PART B) TANGENT SPACE NORMAL
	// TextureNormal_tangentspace

	float visibility = 1.0;
	if (getShadowMapDepth(shadowCoord.xy) < shadowCoord.z + .000001){
		visibility = 0.5;
	}
	
	vec3 N_1 = normalize(texture2D(normalMap, Texcoord_V).xyz * 2.0 - 1.0);
	vec3 color = texture2D(colorMap, Texcoord_V).rgb;

	// PRE-CALCS
	vec3 N = normalize(Normal_V);
	vec3 L = normalize(vec3(viewMatrix * vec4(lightDirectionUniform, 0.0)));
	vec3 V = normalize(-Position_V);

	vec4 vertexNormal_cameraspace = mvMatrix * vec4(N_1, 0.);
	vec3 vertexTangent_modelspace = normalize(cross(N_1, vec3(0.,1.,0.)));
	vec4 vertexTangent_cameraspace = mvMatrix * vec4(vertexTangent_modelspace, 0.);
	vec3 vertexBitangent_cameraspace = cross(vertexNormal_cameraspace.xyz, vertexTangent_cameraspace.xyz);

	mat3 TBN = mat3(vertexTangent_cameraspace.xyz, vertexBitangent_cameraspace, vertexNormal_cameraspace.xyz);
	vec3 nL = normalize(L * TBN);
	vec3 nV = normalize(V * TBN);

	vec3 H = normalize(V + L);

	// AMBIENT
	vec4 ao = texture2D(aoMap, Texcoord_V);
	vec3 light_AMB = ao.rgb * kAmbientUniform;

	// DIFFUSE
	// the color map as the diffuse reflectance of the surface
	// your color information (from part a) should be multiplied into the diffuse term
	//vec3 diffuse = kDiffuseUniform * lightColorUniform;
	vec3 diffuse = kDiffuseUniform * color;
	vec3 light_DFF = diffuse * max(0.0, dot(N_1, nL));

	// SPECULAR
	vec3 specular = kSpecularUniform * lightColorUniform;
	vec3 light_SPC = specular * pow(max(0.0, dot(H, N_1)), shininessUniform);

	// TOTAL
	vec3 TOTAL = light_AMB + visibility * light_DFF + visibility * light_SPC;

	// SHADOW
	// Fill in attenuation for shadow here
	
	gl_FragColor = vec4(TOTAL, 1.0);
	//gl_FragColor = texture2D(shadowMap, shadowCoord.xy);

}
