varying vec3 vNormal;
varying vec4 vLightDirection;
varying vec4 vPosition;

void main() {

	//TOTAL INTENSITY
	//TODO PART 1D: calculate light intensity	
	float lightIntensity = dot(vLightDirection.xyz, normalize(vNormal)); 

   	vec4 resultingColor = vec4(0.0,0.0,0.0,0.0);

   	//TODO PART 1D: change resultingColor based on lightIntensity (toon shading)
	if (lightIntensity > 0.95)
		resultingColor = vec4(0.5,0.5,1.0,1.0);
	else if (lightIntensity > 0.75)
		resultingColor = vec4(0.4,0.4,0.8,1.0);
	else if (lightIntensity > 0.5)
		resultingColor = vec4(0.3,0.3,0.6,1.0);
	else if (lightIntensity > 0.25)
		resultingColor = vec4(0.2,0.2,0.4,1.0);
	else
		resultingColor = vec4(0.1,0.1,0.2,1.0);

   	//TODO PART 1D: change resultingColor to silhouette objects
	vec3 view = vec3(0.0, 0.0, 0.0) - normalize(vPosition.xyz);
	float product = dot(normalize(vNormal), view);
	if (product < 0.4 && product > -0.4) {
		resultingColor = vec4(0.0,0.0,0.0,1.0);
	}
	
	gl_FragColor = resultingColor;
}
