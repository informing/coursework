varying vec4 vPosition;
varying vec4 vLightDirection;
varying vec3 vNormal;
varying vec3 vLightColor;

varying mat3 vNormalMatrix;
varying float vDiffuse;
varying float vSpecular;
varying float vShininess;
varying float vRim;
varying vec3 light_AMB;
varying vec2 uvCoord;

uniform sampler2D hatch1;
uniform sampler2D hatch2;
uniform sampler2D hatch3;
uniform sampler2D hatch4;
uniform sampler2D hatch5;
uniform sampler2D hatch6;

vec4 shade(float diffuse, float specular) {
	float rim = max(0.0, abs(dot(normalize(vNormal), normalize(-vPosition.xyz))));
	float shading = 0.08 + vDiffuse * diffuse + vRim * rim; // + vSpecular * specular;

	vec4 c;
	vec4 ink = vec4(0.0);
	float step = 1.0 / 6.0;
	if (shading <= step) {   
		c = mix(texture2D(hatch6, uvCoord), texture2D(hatch5, uvCoord), 6.0 * shading);
	} else if (shading <= 2.0 * step) {
		c = mix(texture2D(hatch5, uvCoord), texture2D(hatch4, uvCoord) , 6.0 * (shading - step));
	} else if (shading <= 3.0 * step) {
		c = mix(texture2D(hatch4, uvCoord), texture2D(hatch3, uvCoord), 6.0 * (shading - 2. * step));
	} else if (shading <= 4.0 * step) {
		c = mix(texture2D(hatch3, uvCoord), texture2D(hatch2, uvCoord), 6.0 * (shading - 3. * step));
	} else if (shading <= 5.0 * step) {
		c = mix(texture2D(hatch2, uvCoord), texture2D(hatch1, uvCoord), 6.0 * (shading - 4. * step));
	} else {
		c = mix(texture2D(hatch1, uvCoord), vec4(1.0), 6.00 * (shading - 5.0 * step));
	}
	return mix(mix(ink, vec4(1.0), c.r), c, 0.5 );
}

void main() {
	
	//DIFFUSE
	vec3 lightDirection = normalize(vLightDirection.xyz);
	vec3 normal = normalize(vNormal);
	float diffuse = clamp(dot(normal, lightDirection), 0.0, 1.0);
	vec3 light_DFF = vDiffuse * vLightColor * diffuse;

	//SPECULAR
	vec3 light_SPC;
	vec3 bounce = 2.0 * dot(lightDirection, normal) * normal - lightDirection;
	vec3 view = vec3(0.0, 0.0, 0.0) - normalize(vPosition.xyz);
	vec3 h = normalize(lightDirection + view);
	float specular = pow(clamp(dot(h, normal), 0.0, 1.0), vShininess);
	if (dot(normal, lightDirection) < 0.0) {
		light_SPC = vec3(0.0, 0.0, 0.0); // no specular reflection
	} else {
		light_SPC = vSpecular * vLightColor * specular;
	}

	gl_FragColor = shade(diffuse, specular);

	//TOTAL
	//vec3 TOTAL = light_AMB + light_DFF + light_SPC;
	//gl_FragColor = vec4(TOTAL, 0.0);
}
