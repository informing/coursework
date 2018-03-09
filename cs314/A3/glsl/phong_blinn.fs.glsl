varying vec4 vPosition;
varying vec4 vLightDirection;
varying vec3 vNormal;
varying vec3 vLightColor;

varying mat3 vNormalMatrix;
varying float vDiffuse;
varying float vSpecular;
varying float vShininess;
varying vec3 light_AMB;

void main() {

	//DIFFUSE
	vec3 lightDirection = normalize(vLightDirection.xyz);
	vec3 normal = normalize(vNormal);
	float diffuse = clamp(dot(normal, lightDirection), 0.0, 1.0);
	vec3 light_DFF = vDiffuse * vLightColor * diffuse;

	//SPECULAR
	//-l+2*(l dot n)*n
	vec3 light_SPC;
	vec3 bounce = 2.0 * dot(lightDirection, normal) * normal - lightDirection;
	vec3 view = vec3(0.0, 0.0, 0.0) - normalize(vPosition.xyz);
	vec3 h = normalize(lightDirection + view);
	if (dot(normal, lightDirection) < 0.0) {
		light_SPC = vec3(0.0, 0.0, 0.0); // no specular reflection
	} else {
		light_SPC = vSpecular * vLightColor * pow(clamp(dot(h, normal), 0.0, 1.0), vShininess);
	}
	
	//TOTAL
	vec3 TOTAL = light_AMB + light_DFF + light_SPC;
	gl_FragColor = vec4(TOTAL, 0.0);

}
